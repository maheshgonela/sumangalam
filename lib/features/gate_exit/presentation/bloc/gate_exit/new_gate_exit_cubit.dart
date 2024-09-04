import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/utils/date_format_util.dart';
import 'package:sumangalam/features/gate_exit/model/gate_exit_form.dart';
import 'package:sumangalam/features/gate_exit/data/gate_exit_repo.dart';
import 'package:sumangalam/features/gate_entry/model/gate_entry_attachments.dart';

part 'new_gate_exit_cubit.freezed.dart';

enum ActionType { edit, submit, completed }

extension ActionTypeApi on ActionType {
  String toName() {
    return switch (this) {
      ActionType.edit => 'Create',
      ActionType.submit => 'Submit',
      ActionType.completed => 'Submitted',
    };
  }
}

@injectable
class NewGateExitCubit extends AppBaseCubit<NewGateExitState> {
  NewGateExitCubit(this.repo) : super(NewGateExitState.initial());
  final GateExitRepo repo;

  void init(Object? extra) {
    if (extra is GateExitForm) {
      final parsedDate = DFU.toDateTime(extra.exitdate!, 'yyyy-MM-dd');
      final formattedStr = DFU.friendlyFormat(parsedDate);

      final type = switch (extra.status) {
        null => ActionType.edit,
        'Draft' => ActionType.submit,
        'Submitted' => ActionType.completed,
        String() => ActionType.edit,
      };

      emitSafeState(state.copyWith(
        type: type,
        form: extra.copyWith(
          exitdate: formattedStr,
        ),
      ));
    }
  }

  void updateAttachments(GateEntryAttachments files) {
    final vehImage = files.vehicleImage;
    var form = state.form;

    if (vehImage.isNotNull) {
      form = form.copyWith(vehicleImageUrl: files.vehicleImage);
    }

    emitSafeState(state.copyWith(form: form));
  }

  void onFieldValueChanged({
    String? exitno,
    String? exitdate,
    String? createdtime,
    String? customerName,
    String? dcNO,
    String? sONO,
    String? poNumber,
    File? vehicleImage,
    String? vehicleNo,
    String? driverName,
    String? driverMobileNo,
  }) {
    final form = state.form;
    final vechPhoto = vehicleImage ?? form.vehicleImage;

    final newForm = form.copyWith(
      poNumber: poNumber ?? form.poNumber,
      vehicleImage: vechPhoto,
      vehicleImageUrl: vechPhoto.isNotNull ? null : form.vehicleImageUrl,
      vehicleNo: vehicleNo ?? form.vehicleNo,
      driverName: driverName ?? form.driverName,
      driverMobileNo: driverMobileNo ?? form.driverMobileNo,
      createdtime: createdtime ?? form.createdtime,
      customerName: customerName ?? form.customerName,
      dcNo: dcNO ?? form.dcNo,
      exitdate: exitdate ?? form.exitdate,
      exitno: exitno ?? form.exitno,
      sONO: sONO ?? form.sONO,
    );
    emitSafeState(state.copyWith(
      form: newForm,
      error: null,
    ));
  }

  void processGateExit() {
    try {
      if (state.type == ActionType.edit) {
        return _createGateExit();
      } else if (state.type == ActionType.submit) {
        return _submitGateExit();
      }
    } on Exception catch (e, st) {
      $logger.error('[NewGateExitCubit]', e, st);
      _emitError(e.toString());
    }
  }

  void _createGateExit() async {
    final validation = _validate();

    if (validation.isSome()) {
      final msg = validation.getOrElse(() => throw Exception());
      return _emitError(msg);
    }

    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.createGateExit(state.form);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        final docNo = r.first;
        final message = r.second;
        return emitSafeState(state.copyWith(
            form: state.form.copyWith(exitno: docNo, status: 'Draft'),
            isLoading: false,
            type: ActionType.submit,
            isSuccess: true,
            successMsg: message));
      },
    );
  }

  void _submitGateExit() async {
    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.submitGateExit(state.form);
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

    if (form.customerName.doesNotHaveValue) {
      return optionOf('Select CustomerName ');
    } else if (form.dcNo.doesNotHaveValue) {
      return optionOf('Select DC Number');
    } else if (form.sONO.doesNotHaveValue) {
      return optionOf('Select SoNumber');
    } else if (form.poNumber.doesNotHaveValue) {
      return optionOf('Select Purchase Order No.');
    } else if (form.vehicleImage.isNull && form.vehicleImageUrl.isNull) {
      return optionOf('Capture Vehicle Image');
    } else if (form.vehicleNo.doesNotHaveValue) {
      return optionOf('Enter Vehicle No.');
    } else if (form.driverName.doesNotHaveValue) {
      return optionOf('Enter Driver Name');
    } else if (form.driverMobileNo.isNull) {
      return optionOf('Enter Driver Mobile No.');
    }

    return const None();
  }
}

@freezed
class NewGateExitState with _$NewGateExitState {
  const factory NewGateExitState({
    required GateExitForm form,
    required bool isLoading,
    required bool isSuccess,
    required ActionType type,
    String? successMsg,
    Failure? error,
  }) = _NewGateExitState;

  factory NewGateExitState.initial() {
    final exitDate = DFU.friendlyFormat(DFU.now());
    final createdtime = DFU.hhMMss(DFU.now());
    return NewGateExitState(
      form: GateExitForm(
        exitdate: exitDate,
        createdtime: createdtime,
      ),
      isLoading: false,
      isSuccess: false,
      type: ActionType.edit,
    );
  }
}
