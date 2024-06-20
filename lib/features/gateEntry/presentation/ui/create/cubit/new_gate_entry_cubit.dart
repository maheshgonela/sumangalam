import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/features/gateEntry/data/gate_entry_repo.dart';
import 'package:sumangalam/features/gateEntry/model/new_gate_entry_form.dart';
import 'package:sumangalam/features/gateEntry/model/receiver_mode.dart';

part 'new_gate_entry_cubit.freezed.dart';

enum ActionType { save, submit }

@injectable
class NewGateEntryCubit extends AppBaseCubit<NewGateEntryState> {
  NewGateEntryCubit(this.repo) : super(NewGateEntryState.initial());
  final GateEntryRepo repo;

  void onModeChange(ReceiverMode mode) {
    emitSafeState(state.copyWith(
      form: state.form.copyWith(
        receiveMode: mode,
        delivererName:
            mode == ReceiverMode.byHand ? state.form.delivererName : null,
        delivererMobileNo:
            mode == ReceiverMode.byHand ? state.form.delivererMobileNo : null,
        vehiclePhoto:
            mode == ReceiverMode.byVehicle ? state.form.vehiclePhoto : null,
        vehicleNo: mode == ReceiverMode.byVehicle ? state.form.vehicleNo : null,
        driverName:
            mode == ReceiverMode.byVehicle ? state.form.driverName : null,
        driverMobileNo:
            mode == ReceiverMode.byVehicle ? state.form.driverMobileNo : null,
        sealPhoto: mode == ReceiverMode.byVehicle ? state.form.sealPhoto : null,
        weightPhoto:
            mode == ReceiverMode.byVehicle ? state.form.weightPhoto : null,
      ),
    ));
  }

  void onFieldValueChanged({
    String? creationDate,
    String? materialType,
    String? vendorName,
    String? receiveMode,
    String? poNumber,
    String? vendorInvoiceNo,
    String? vendorInvoiceDate,
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
  }) {
    final form = state.form;
    final documentPhoto = docPhoto.isNull
        ? form.docPhoto
        : base64Encode(docPhoto!.readAsBytesSync());
    final vechPhoto = vehiclePhoto.isNull
        ? form.vehiclePhoto
        : base64Encode(vehiclePhoto!.readAsBytesSync());

    final sealingPhoto = sealPhoto.isNull
        ? form.sealPhoto
        : base64Encode(sealPhoto!.readAsBytesSync());
    final weightImage = weightPhoto.isNull
        ? form.weightPhoto
        : base64Encode(weightPhoto!.readAsBytesSync());

    final newForm = form.copyWith(
      creationDate: creationDate ?? form.creationDate,
      materialType: materialType ?? form.materialType,
      vendorName: vendorName ?? form.materialType,
      poNumber: poNumber ?? form.poNumber,
      delivererName: delivererName ?? form.delivererName,
      delivererMobileNo: delivererMobileNo ?? form.delivererMobileNo,
      docPhoto: documentPhoto,
      receiveMode: ReceiverMode.fromName(receiveMode) ?? form.receiveMode,
      vehiclePhoto: vechPhoto,
      vehicleNo: vehicleNo ?? form.vehicleNo,
      driverName: driverName ?? form.driverName,
      driverMobileNo: driverMobileNo ?? form.driverMobileNo,
      vendorInvoiceNo: vendorInvoiceNo ?? form.vendorInvoiceNo,
      vendorInvoiceDate: vendorInvoiceDate ?? form.vendorInvoiceDate,
      sealPhoto: sealingPhoto,
      weightPhoto: weightImage,
      remarks: remarks ?? form.remarks,
    );

    emitSafeState(state.copyWith(form: newForm));
  }

  void submitForm() {
    emitSafeState(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 2), () {
      emitSafeState(state.copyWith(isLoading: false, isSuccess: true));
    });
  }

  void create() async {
    final validation = _validate();

    return validation.fold(() async {
      emitSafeState(state.copyWith(isLoading: true));
      final response = state.type == ActionType.save
          ? await repo.createGateEntry(state.form)
          : await repo.submitGateEntry(state.form);
          print('response $response');
      return response.fold(
          (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
          (r) => emitSafeState(state.copyWith(
              isLoading: false, isSuccess: true, successMsg: r)));
    }, _emitError);
  }

  void _emitError(String error) {
    final failure = Failure(error: error, title: 'Missing Fields');
    emitSafeState(state.copyWith(error: failure, isLoading: false));
  }

  Option<String> _validate() {
    final form = state.form;
    if (form.creationDate.doesNotHaveValue) {
      return optionOf('Please Select GateEntry Date');
    } else if (form.creationDate.doesNotHaveValue) {
      return optionOf('Please Select Created Time');
    } else if (form.materialType.doesNotHaveValue) {
      return optionOf('Please Select Material Type .');
    } else if (form.vendorName.doesNotHaveValue) {
      return optionOf('Please Select Vendor Name .');
    } else if (form.poNumber.doesNotHaveValue) {
      return optionOf('Please Select Po Number .');
    } else if (form.receiveMode!.name.doesNotHaveValue) {
      return optionOf('Please Select Recevie Mode .');
    } else if (form.delivererName.doesNotHaveValue) {
      return optionOf('Enter delivere Name .');
    } else if (form.delivererMobileNo.doesNotHaveValue) {
      return optionOf('Enter Deliverer Mobile Number.');
    } else if (form.docPhoto.doesNotHaveValue) {
      return optionOf('Capture document photo.');
    } else if (form.vehiclePhoto.doesNotHaveValue) {
      return optionOf('Capture Vehicle Photo.');
    } else if (form.vehicleNo.doesNotHaveValue) {
      return optionOf('Enter Vehicle Number.');
    } else if (form.delivererName.doesNotHaveValue) {
      return optionOf('Enter driver Name .');
    } else if (form.driverMobileNo.doesNotHaveValue) {
      return optionOf('Enter driver Mobile Number.');
    } else if (form.vendorInvoiceNo.doesNotHaveValue) {
      return optionOf('Enter Vendor Invoice Amount.');
    } else if (form.vendorInvoiceDate.doesNotHaveValue) {
      return optionOf('Please Select Vendor Invoice Date.');
    } else if (form.sealPhoto.doesNotHaveValue) {
      return optionOf('Please Capture Seal Photo.');
    } else if (form.weightPhoto.doesNotHaveValue) {
      return optionOf('Please Capture weight Photo .');
    } else if (form.remarks.doesNotHaveValue) {
      return optionOf('Enter Remarks.');
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
    return const NewGateEntryState(
        form: GateEntryForm(),
        isLoading: false,
        isSuccess: false,
        type: ActionType.save);
  }
}
