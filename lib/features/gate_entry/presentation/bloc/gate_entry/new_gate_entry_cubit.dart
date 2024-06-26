import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/utils/date_format_util.dart';
import 'package:sumangalam/features/gate_entry/data/gate_entry_repo.dart';
import 'package:sumangalam/features/gate_entry/model/gate_entry_attachments.dart';
import 'package:sumangalam/features/gate_entry/model/new_gate_entry_form.dart';
import 'package:sumangalam/features/gate_entry/model/receiver_mode.dart';

part 'new_gate_entry_cubit.freezed.dart';

enum ActionType { vechileIn, unloading, vechileOut, completed }

extension ActionTypeApi on ActionType {
  String toName() {
    return switch(this) {
      ActionType.vechileIn => 'Create',
      ActionType.unloading => 'Update',
      ActionType.vechileOut || ActionType.completed => 'Submit',
    };
  }
}

@injectable
class NewGateEntryCubit extends AppBaseCubit<NewGateEntryState> {
  NewGateEntryCubit(this.repo) : super(NewGateEntryState.initial());
  final GateEntryRepo repo;

  void init(Object? extra) {
    if (extra is GateEntryForm) {
      final parsedDate = DFU.toDateTime(extra.entryDate!, 'yyyy-MM-dd');
      final formattedStr = DFU.friendlyFormat(parsedDate);

      String? formattedStr2;
      if(extra.vendorInvoiceDate.containsValidValue) {
        final parsedDate1 = DFU.toDateTime(extra.vendorInvoiceDate!, 'yyyy-MM-dd');
        formattedStr2 = DFU.friendlyFormat(parsedDate1);
      }
      
      final type = switch (extra.status) {
        null => ActionType.vechileIn,
        'Draft' || 'Update' => ActionType.unloading,
        'Submit' => ActionType.vechileOut,
        String() => ActionType.vechileIn,
      };
      emitSafeState(state.copyWith(
        type: type,
        form: extra.copyWith(entryDate: formattedStr, vendorInvoiceDate: formattedStr2),
      ));
    }
  }

  void updateAttachments(GateEntryAttachments files) {
    final document = files.document;
    final unloadedPile = files.unloadedPile;
    final vehImage = files.vehicleImage;
    final sealtag = files.sealTag;
    var form = state.form;

    if (document.isNotNull) {
      form = form.copyWith(docPhotoUrl: files.document);
    }
    if (unloadedPile.isNotNull) {
      form = form.copyWith(unloadedPilePhotoUrl: files.unloadedPile);
    }
    if (vehImage.isNotNull) {
      form = form.copyWith(vehiclePhotoUrl: files.vehicleImage);
    }
    if (sealtag.isNotNull) {
      form = form.copyWith(sealPhotoUrl: files.sealTag);
    }
    emitSafeState(state.copyWith(form: form));
  }

  void onModeChange(ReceiverMode mode) {
    final form = state.form.copyWith(receiveMode: mode);
    emitSafeState(state.copyWith(form: form));
  }

  void onFieldValueChanged({
    String? creationDate,
    String? materialType,
    String? vendorName,
    String? receiveMode,
    String? poNumber,
    String? vendorInvoiceNo,
    String? vendorInvoiceDate,
    String? weight1,
    String? remarks,
    File? docPhoto,

    // "By Hand" fields
    String? delivererName,
    String? delivererMobileNo,

    // "By Vehicle" fields
    File? vehiclePhoto,
    String? vehicleNo,
    String? driverName,
    String? driverMobileNo,
    File? sealPhoto,
    File? weightPhoto,
    File? pilePhoto,
    File? weight2Photo,
  }) {
    final form = state.form;
    final documentPhoto = docPhoto ?? form.docPhoto;
    final vechPhoto = vehiclePhoto ?? form.vehiclePhoto;
    final weightVal =
        weight1.isNotNull ? double.tryParse(weight1!) : form.weight1;
    final sealingPhoto = sealPhoto ?? form.sealPhoto;
    final weight1Photo = weightPhoto ?? form.weight1Photo;
    final unloadedPilePhoto = pilePhoto ?? form.unloadedPilePhoto;
    final weight2Image = weight2Photo ?? form.weight2Photo;

    final newForm = form.copyWith(
      materialType: materialType ?? form.materialType,
      vendor: vendorName ?? form.vendor,
      poNumber: poNumber ?? form.poNumber,
      delivererName: delivererName ?? form.delivererName,
      delivererMobileNo: delivererMobileNo ?? form.delivererMobileNo,
      docPhoto: documentPhoto,
      docPhotoUrl: documentPhoto.isNotNull ? null : form.docPhotoUrl,
      receiveMode: ReceiverMode.fromName(receiveMode) ?? form.receiveMode,
      vehiclePhoto: vechPhoto,
      vehiclePhotoUrl: vechPhoto.isNotNull ? null : form.vehiclePhotoUrl,
      vehicleNo: vehicleNo ?? form.vehicleNo,
      driverName: driverName ?? form.driverName,
      driverMobileNo: driverMobileNo ?? form.driverMobileNo,
      vendorInvoiceNo: vendorInvoiceNo ?? form.vendorInvoiceNo,
      vendorInvoiceDate: vendorInvoiceDate ?? form.vendorInvoiceDate,
      sealPhoto: sealingPhoto,
      sealPhotoUrl: sealingPhoto.isNotNull ? null : form.sealPhotoUrl,
      remarks: remarks ?? form.remarks,
      weight1: weightVal,
      weight1Photo: weight1Photo,
      weight2Photo: weight2Image,
      unloadedPilePhoto: unloadedPilePhoto,
    );
    emitSafeState(state.copyWith(form: newForm));
  }

  void processGateEntry() {
    try {
      if (state.type == ActionType.vechileIn) {
        return _createGateEntry();
      } else if (state.type == ActionType.unloading) {
        return _updateGateEntry();
      } else if (state.type == ActionType.vechileOut) {
        return _submitGateEntry();
      }
      return _emitError('Invalid action');
    } on Exception catch (e, st) {
      $logger.error('[NewGateEntryCubit]', e, st);
      _emitError(e.toString());
    }
  }

  void _createGateEntry() async {
    final validation = _validate();
    if (validation.isSome()) {
      final msg = validation.getOrElse(() => throw Exception());
      return _emitError(msg);
    }

    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.createGateEntry(state.form);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        final docNo = r.first;
        final form = state.form.copyWith(status: 'Draft', gateEntryNo: docNo);
        final message = r.second;
        return emitSafeState(state.copyWith(
            form: form,
            isLoading: false,
            type: ActionType.unloading,
            isSuccess: true,
            successMsg: message));
      },
    );
  }

  void _updateGateEntry() async {
    final form = state.form;
    if (form.unloadedPilePhoto.isNull && form.unloadedPilePhotoUrl.isNull) {
      return _emitError('Capture Unloaded Pile Photo');
    }
    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.updatePileDetails(state.form);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        final updatedState =
            state.copyWith(isSuccess: true, successMsg: r, isLoading: false, type: ActionType.vechileOut);
        return emitSafeState(updatedState);
      },
    );
  }

  void _submitGateEntry() async {
    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.submitGateEntry(state.form);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        final form = state.form.copyWith(status: 'Submit');
        final updatedState = state.copyWith(
            isSuccess: true, successMsg: r, isLoading: false, form: form, type: ActionType.completed);
        return emitSafeState(updatedState);
      },
    );
  }

  void _emitError(String error) {
    final failure = Failure(error: error, title: 'Missing Fields');
    emitSafeState(state.copyWith(error: failure, isLoading: false));
  }

  void handled() => emitSafeState(
      state.copyWith(error: null, isSuccess: false, successMsg: null));

  Option<String> _validate() {
    final form = state.form;
    if (form.materialType.doesNotHaveValue) {
      return optionOf('Select Material Type');
    } else if (form.vendor.doesNotHaveValue) {
      return optionOf('Select Vendor');
    } else if (form.poNumber.doesNotHaveValue) {
      return optionOf('Select Purchase Order No.');
    } else if (form.receiveMode.isNull) {
      return optionOf('Select Recevie Mode');
    } else if (form.receiveMode == ReceiverMode.byHand) {
      if (form.delivererName.doesNotHaveValue) {
        return optionOf('Enter Delivery Person Name');
      } else if (form.delivererMobileNo.doesNotHaveValue) {
        return optionOf('Enter Delivery Person Mobile No.');
      }
    } else if (form.receiveMode == ReceiverMode.byVehicle) {
      if (form.vehiclePhoto.isNull) {
        return optionOf('Capture Vehicle Photo.');
      } else if (form.vehicleNo.doesNotHaveValue) {
        return optionOf('Enter Vechicle No.');
      } else if (form.driverName.doesNotHaveValue) {
        return optionOf('Enter Driver Name');
      } else if (form.driverMobileNo.isNull) {
        return optionOf('Enter Driver Mobile No.');
      } else if (form.sealPhoto.isNull && form.sealPhotoUrl.isNull) {
        return optionOf('Capture Seal Photo');
      } else if (form.weight1.isNull) {
        return optionOf('Enter weight with Material');
      } else if (form.weight1Photo.isNull && form.weight1Url.isNull) {
        return optionOf('Capture Weight (with Material) Photo');
      }
    } else if (form.vendorInvoiceNo.doesNotHaveValue) {
      return optionOf('Enter Vendor Invoice No.');
    } else if (form.vendorInvoiceDate.doesNotHaveValue) {
      return optionOf('Enter Vendor Invoice Date');
    } else if (form.docPhoto.isNull && form.docPhoto.isNull) {
      return optionOf('Capture Document Photo');
    }
    return const None();
  }
}

@freezed
class NewGateEntryState with _$NewGateEntryState {
  const factory NewGateEntryState({
    required GateEntryForm form,
    required bool isLoading,
    required bool isSuccess,
    required ActionType type,
    String? successMsg,
    Failure? error,
  }) = _NewGateEntryState;

  factory NewGateEntryState.initial() {
    final entryDate = DFU.friendlyFormat(DFU.now());
    final createdtime = DFU.hhMMss(DFU.now());
    return NewGateEntryState(
      form: GateEntryForm(
          entryDate: entryDate,
          createdtime: createdtime,
          receiveMode: ReceiverMode.byVehicle),
      isLoading: false,
      isSuccess: false,
      type: ActionType.vechileIn,
    );
  }
}