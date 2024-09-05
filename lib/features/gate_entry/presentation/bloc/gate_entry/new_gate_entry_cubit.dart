import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/features/gate_entry/data/gate_entry_repo.dart';
import 'package:sumangalam/features/gate_entry/model/gate_entry_attachments.dart';
import 'package:sumangalam/features/gate_entry/model/new_gate_entry_form.dart';
import 'package:sumangalam/features/gate_entry/model/receiver_mode.dart';

part 'new_gate_entry_cubit.freezed.dart';

enum ActionType { vechileIn, unloading, vechileOut, completed }

extension ActionTypeApi on ActionType {
  String toName() {
    return switch (this) {
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
      if (extra.vendorInvoiceDate.containsValidValue) {
        final parsedDate1 =
            DFU.toDateTime(extra.vendorInvoiceDate!, 'yyyy-MM-dd');
        formattedStr2 = DFU.friendlyFormat(parsedDate1);
      }

      final type = switch (extra.status) {
        null => ActionType.vechileIn,
        'Draft' => ActionType.unloading,
        'Update' => ActionType.vechileOut,
        'Submitted' => ActionType.completed,
        String() => ActionType.vechileIn,
      };
      emitSafeState(state.copyWith(
        type: type,
        form: extra.copyWith(
            entryDate: formattedStr, vendorInvoiceDate: formattedStr2),
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
    String? materialType,
    String? vendorName,
    ReceiverMode? receiveMode,
    String? poNumber,
    String? vendorInvoiceNo,
    String? vendorInvoiceDate,
    String? weight1,
    String? weight2,
    String? documentWeight,
    String? remarks,
    bool? isPOAvailable,
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
    final weight1Val =
        weight1.isNotNull ? double.tryParse(weight1!) : form.weight1;
    final weight2Val =
        weight2.isNotNull ? double.tryParse(weight2!) : form.weight2;
    final docWeightVal =
        documentWeight.isNotNull ? documentWeight! : form.documentWeight;
    final sealingPhoto = sealPhoto ?? form.sealPhoto;
    final weight1Photo = weightPhoto ?? form.weight1Photo;
    final unloadedPilePhoto = pilePhoto ?? form.unloadedPilePhoto;
    final weight2Image = weight2Photo ?? form.weight2Photo;
    final actualWeight = weight2Val.isNotNull && weight1Val.isNotNull
        ? weight1Val! - weight2Val!
        : null;
    final newForm = form.copyWith(
      materialType: materialType ?? form.materialType,
      vendor: vendorName?.trim() ?? form.vendor,
      poNumber: poNumber ?? form.poNumber,
      delivererName: delivererName ?? form.delivererName,
      delivererMobileNo: delivererMobileNo ?? form.delivererMobileNo,
      docPhoto: documentPhoto,
      docPhotoUrl: documentPhoto.isNotNull ? null : form.docPhotoUrl,
      receiveMode: receiveMode ?? form.receiveMode,
      vehiclePhoto: vechPhoto,
      isPOAvailable: isPOAvailable ?? form.isPOAvailable,
      vehiclePhotoUrl: vechPhoto.isNotNull ? null : form.vehiclePhotoUrl,
      vehicleNo: vehicleNo ?? form.vehicleNo,
      driverName: driverName ?? form.driverName,
      driverMobileNo: driverMobileNo ?? form.driverMobileNo,
      vendorInvoiceNo: vendorInvoiceNo ?? form.vendorInvoiceNo,
      vendorInvoiceDate: vendorInvoiceDate ?? form.vendorInvoiceDate,
      sealPhoto: sealingPhoto,
      sealPhotoUrl: sealingPhoto.isNotNull ? null : form.sealPhotoUrl,
      remarks: remarks ?? form.remarks,
      weight1: weight1Val,
      weight2: weight2Val,
      documentWeight: docWeightVal,
      weight1Photo: weight1Photo,
      weight2Photo: weight2Image,
      actualWeight: actualWeight,
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
        final nextStatus = state.form.isOtherMaterialType ? 'Submit' : 'Draft';
        final nextType = state.form.isOtherMaterialType
            ? ActionType.vechileOut
            : ActionType.unloading;
        final form =
            state.form.copyWith(status: nextStatus, gateEntryNo: docNo);
        final message = r.second;
        return emitSafeState(state.copyWith(
            form: form,
            isLoading: false,
            type: nextType,
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
        final updatedState = state.copyWith(
            isSuccess: true,
            successMsg: r,
            isLoading: false,
            type: ActionType.vechileOut);
        return emitSafeState(updatedState);
      },
    );
  }

  void _submitGateEntry() async {
    final form = state.form;
    if(form.isOtherMaterialType.isFalse) {
      if (form.weight2.isNull) {
        return _emitError('Enter Weight without Material');
      }

      if (form.actualWeight.isNull) {
        return _emitError(
            'Update Weight without out material. To obtain actual weight.');
      }
      if (form.actualWeight!.isNegative) {
        return _emitError('Actual weight cant be Negative');
      }
      final isByVehicle = form.receiveMode == ReceiverMode.byVehicle;
      if (isByVehicle &&
          form.weight2Photo.isNull &&
          form.weight2PhotoUrl.isNull) {
        return _emitError('Upload Weight without Material Photo');
      }
    }
    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.submitGateEntry(state.form);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        final form = state.form.copyWith(status: 'Submit');
        final updatedState = state.copyWith(
            isSuccess: true,
            successMsg: r,
            isLoading: false,
            form: form,
            type: ActionType.completed);
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
    final isPOAvailable = form.isPOAvailable.isTrue;
    if (form.materialType.doesNotHaveValue) {
      return optionOf('Select Material Type');
    } else if (form.vendor.doesNotHaveValue) {
      return optionOf('Select Supplier');
    } else if (isPOAvailable && form.poNumber.doesNotHaveValue) {
      return optionOf('Select Purchase Order No.');
    } else if (form.receiveMode.isNull) {
      return optionOf('Select Recevie Mode');
    }
    if (form.receiveMode == ReceiverMode.byHand) {
      if (form.delivererName.doesNotHaveValue) {
        return optionOf('Enter Delivery Person Name');
      } else if (form.delivererMobileNo.doesNotHaveValue) {
        return optionOf('Enter Delivery Person Mobile No.');
      }
    }
    if (form.receiveMode == ReceiverMode.byVehicle) {
      if (form.vehiclePhoto.isNull) {
        return optionOf('Capture Vehicle Photo.');
      } else if (form.vehicleNo.doesNotHaveValue) {
        return optionOf('Enter Vehicle No.');
      } else if (form.driverName.doesNotHaveValue) {
        return optionOf('Enter Driver Name');
      } else if (form.driverMobileNo.isNull) {
        return optionOf('Enter Driver Mobile No.');
      }
    }
    final isNotOtherMT = form.isOtherMaterialType;
    final isImportedScrap = form.isImportedScrap;

    if (isNotOtherMT.isFalse) {
      if (form.vendorInvoiceNo.doesNotHaveValue) {
        return optionOf('Enter Vendor Invoice No.');
      } else if (form.vendorInvoiceDate.doesNotHaveValue) {
        return optionOf('Enter Vendor Invoice Date');
      } else if (isPOAvailable &&
          form.docPhoto.isNull &&
          form.docPhotoUrl.isNull) {
        return optionOf('Capture Document Photo');
      } else if (form.weight1.isNull) {
        return optionOf('Enter Vehicle weight with Material');
      } else if (form.weight1Photo.isNull && form.weight1Url.isNull) {
        return optionOf('Capture Vehicle Weight (with Material) Photo');
      } else if (isPOAvailable && form.documentWeight.isNull) {
        return optionOf('Enter Document Weight');
      } else if (isImportedScrap &&
          form.sealPhoto.isNull &&
          form.sealPhotoUrl.isNull) {
        return optionOf('Capture Seal Tag Photo');
      }
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
