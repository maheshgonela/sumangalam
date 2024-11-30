import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/features/hr/data/hr_repo.dart';
import 'package:sumangalam/features/hr/model/on_duty_form.dart';

part 'new_on_duty_cubit.freezed.dart';

@injectable
class NewOnDutyCubit extends AppBaseCubit<NewOnDutyState> {
  NewOnDutyCubit(this.repo) : super(NewOnDutyState.initial());
  final HRRepo repo;

  void onUpdate({
    String? logType,
    String? customer,
    String? purpose,
    String? remarks,
    String? type,
    String? location,
    File? selfie,
  }) {
    final form = state.form;
    final updatedForm = form.copyWith(
      custDetails: customer ?? form.custDetails,
      dutyType: type ?? form.dutyType,
      location: location ?? form.location,
      logType: logType ?? form.logType,
      purpose: purpose ?? form.purpose,
      remarks: remarks ?? form.remarks,
      selfieFile: selfie ?? form.selfieFile,
    );
    emitSafeState(state.copyWith(form: updatedForm));
  }

  void submitForm() {
    _validate().fold(_submit, _onError);
  }

  Option<String> _validate() {
    final form = state.form;
    if (form.custDetails.doesNotHaveValue) {
      return optionOf('Enter Customer Details');
    } else if (form.selfieFile == null) {
      return optionOf('Capture Live Selfie');
    } else if (form.logType.doesNotHaveValue) {
      return optionOf('Select Log Type');
    } else if (form.purpose.doesNotHaveValue) {
      return optionOf('Enter Purpose');
    } 
    return const None();
  }

  void _onError(String error) {
    final failure = Failure(error: error, title: 'Missing Fields');
    emitSafeState(state.copyWith(failure: failure));
  }

  void _submit() async {
    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.createOnDuty(state.form);
    res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, failure: l)), 
      (r) => emitSafeState(state.copyWith(isLoading: false, isSuccess: true)),
    );
  }

  void errorHandled() => emitSafeState(state.copyWith(isLoading: false, failure: null, isSuccess: false));
}

@freezed
class NewOnDutyState with _$NewOnDutyState {
  const factory NewOnDutyState({
    required OnDutyForm form,
    required bool isLoading,
    required bool isSuccess,
    Failure? failure,
  }) = _NewOnDutyState;

  factory NewOnDutyState.initial() {
    final time = DFU.fullDateFomrat();
    return NewOnDutyState(
        form: OnDutyForm(time: time),
        isLoading: false,
        isSuccess: false,
      );
  }
}
