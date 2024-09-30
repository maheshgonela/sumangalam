import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/utils/attachment_selection_mixin.dart';
import 'package:sumangalam/core/utils/upper_case_formatter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/bloc_providers.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/gate_exit/new_gate_exit_cubit.dart';
import 'package:sumangalam/features/gate_exit/presentation/ui/create/widgets/gate_exit_builder.dart';

class GateExitFormWidget extends StatefulWidget {
  const GateExitFormWidget({super.key});

  @override
  State<GateExitFormWidget> createState() => _GateExitFormWidgetState();
}

class _GateExitFormWidgetState extends State<GateExitFormWidget>
    with AttahcmentSelectionMixin {
  final dateTime = DateTime.now();

  final Map<String, TextEditingController> controllers = {
    'vehicleNo': TextEditingController(),
    'driverMobileNo': TextEditingController(),
    'driverName': TextEditingController(),
    'WeightWithMaterial': TextEditingController(),
    'WeightWithoutMaterial': TextEditingController(),
  };


  Future<void> scanBarcodeNormal() async {
    final res = kReleaseMode
      ? await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE)
      : 'SINV-24-00003';
    if(!mounted) return;
    if(res.containsValidValue) {
      context.cubit<SalesInvoiceCubit>().request(res);
    } else {
      context.showSnackbar('Scan Valid Sales Invoice', AppSnackBarType.info);
    }
  }

  bool _extracingWithMaterial = false;
  bool _extracingWithoutMaterial = false;



  @override
  Widget build(BuildContext context) {
    final formstate = context.read<NewGateExitCubit>().state;
    final isSubmitted = formstate.type == ActionType.completed;
    final form = formstate.form;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: BlocListener<NewGateExitCubit, NewGateExitState>(
        listenWhen: (p, c) => p.isSuccess != c.isSuccess,
        listener: (_, state) {
          if (state.isSuccess) {
            setState(() {});
          }
        },
        child: SpacedColumn(
          margin: const EdgeInsets.all(12.0),
          defaultHeight: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
              title: 'Sales Invoice',
              initialValue: form.dcNo,
              hintText: 'Scan Sales Invoice',
              readOnly: true,
              suffixIcon: BlocConsumer<SalesInvoiceCubit, SalesInvoiceState>(
                listener: (_, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (data) {
                      context.cubit<NewGateExitCubit>().onFieldValueChanged(
                        dcNO: data.name,
                        customerName: data.customerName,
                        sONO: data.salesOrder,
                        poNumber: data.purchaseOrder,
                      );
                      setState(() {
                        controllers['customerName']?.text = data.customerName ?? '';
                        controllers['sONO']?.text = data.salesOrder ?? '';
                        controllers['poNumber']?.text = data.purchaseOrder ?? '';
                      });
                    },
                    failure: (failure) {
                      AppDialog.showErrorDialog(context, content: failure.error, onTapDismiss: context.exit);
                    },
                  );
                },
                builder: (_, state) {
                  if(state.isLoading) return const AppLoadingIndicator();
                  return IconButton(
                    onPressed: formstate.type == ActionType.edit ? scanBarcodeNormal : null,
                    icon: const Icon(Icons.document_scanner_outlined),
                  );
                },
              ),
            ),
            
            if(form.dcNo.containsValidValue)...[
              DateSelectionField(
                title: 'Gate Exit Date',
                initialValue: form.exitdate,
                readOnly: true,
                firstDate: DFU.now(),
                lastDate: DFU.now(),
                onDateSelect: (date) {},
              ),
              InputField(
                title: 'Created Time',
                readOnly: true,
                initialValue: form.createdtime,
              ),
              if (form.dcNo.isNotNull) ...[
                InputField(
                  title: 'Customer Name',
                  readOnly: true,
                  initialValue: form.customerName,
                  controller: controllers['customerName'] =
                      TextEditingController(text: form.customerName),
                  onChanged: (customerName) {
                    context
                        .cubit<NewGateExitCubit>()
                        .onFieldValueChanged(customerName: customerName);
                  },
                ),
                InputField(
                  title: 'SO Number',
                  readOnly: true,
                  initialValue: form.sONO,
                  controller: controllers['sONO'] =
                      TextEditingController(text: form.sONO),
                  onChanged: (sONO) {
                    context
                        .cubit<NewGateExitCubit>()
                        .onFieldValueChanged(sONO: sONO);
                  },
                ),
                InputField(
                  title: 'PO Number',
                  readOnly: true,
                  initialValue: form.poNumber,
                  controller: controllers['poNumber'],
                  onChanged: (poNumber) {
                    context
                        .cubit<NewGateExitCubit>()
                        .onFieldValueChanged(poNumber: poNumber);
                  },
                ),
              ],
              InputField(
                title: 'Driver Name',
                initialValue: form.driverName,
                readOnly: isSubmitted,
                controller: controllers['driverName'],
                inputFormatters: [UpperCaseTextFormatter()],
                suffixIcon: const Icon(Icons.person_outlined),
                onChanged: (driverName) {
                  context
                      .cubit<NewGateExitCubit>()
                      .onFieldValueChanged(driverName: driverName);
                },
              ),
              InputField(
                title: 'Driver Mobile Number',
                initialValue: form.driverMobileNo,
                readOnly: isSubmitted,
                controller: controllers['driverMobileNo'],
                suffixIcon: const Icon(Icons.dialpad_outlined),
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
                inputType: TextInputType.number,
                onChanged: (driverMobileNo) {
                  context
                      .cubit<NewGateExitCubit>()
                      .onFieldValueChanged(driverMobileNo: driverMobileNo);
                },
              ),
              InputField(
                title: 'Vehicle Number',
                controller: controllers['vehicleNo'],
                initialValue: form.vehicleNo,
                readOnly: isSubmitted,
                inputFormatters: [UpperCaseTextFormatter()],
                suffixIcon: const Icon(Icons.pin_outlined),
                onChanged: (vehicleNo) {
                  context
                      .cubit<NewGateExitCubit>()
                      .onFieldValueChanged(vehicleNo: vehicleNo);
                },
              ),
              ImageSelectionWidget(
                title: 'Vehicle Image',
                initialValue: form.vehicleImageUrl,
                readOnly: isSubmitted,
                onImage: (vehicleImage) {
                  context
                      .cubit<NewGateExitCubit>()
                      .onFieldValueChanged(vehicleImage: vehicleImage);
                },
                icon: const Icon(Icons.local_shipping_outlined,
                    color: AppColors.white, size: 32),
              ),
              InputField(
                title: 'Vehicle Weight With Material',
                controller: controllers['WeightWithMaterial'],
                initialValue: NumUtils.toVal(form.vehicleWithMaterial),
                readOnly: true,
                inputType: TextInputType.number,
                inputFormatters: [UpperCaseTextFormatter()],
                suffixIcon: _extracingWithMaterial ? const AppLoadingIndicator() : const Icon(Icons.pin_outlined),
                onChanged: (vWithMaterial) {
                  final double vWithMaterial1 =
                      double.tryParse(vWithMaterial) ?? 0.0;
                  context
                      .cubit<NewGateExitCubit>()
                      .onFieldValueChanged(vWithMaterial: vWithMaterial1);
                },
              ),
              ImageSelectionWidget(
                title: 'Vehicle Wight With Material Photo',
                initialValue: form.vechileMaterialUrl,
                readOnly: isSubmitted,
                onImage: (materailImage) async {
                  if(materailImage.isNull) return;
                  setState(() => _extracingWithMaterial = true);
                  context.cubit<NewGateExitCubit>().onFieldValueChanged(
                      vehicleWithMaterialPhoto: materailImage);
                  final res = await _uploadImage(materailImage!);
                  print('res: $res');
                  if(res.isSome()) {
                    final value = double.parse(res.getOrElse(() => ''));
                    context.cubit<NewGateExitCubit>().onFieldValueChanged(vWithMaterial: value); 
                  }
                  setState(() => _extracingWithMaterial = false);
                },
                icon: const Icon(Icons.local_shipping_outlined,
                    color: AppColors.white, size: 32),
              ),
              InputField(
                title: 'Vehicle Weight Without Material',
                controller: controllers['WeightWithoutMaterial'],
                initialValue: NumUtils.toVal(form.vehicleWithOutMaterial),
                readOnly: true,
                inputType: TextInputType.number,
                inputFormatters: [UpperCaseTextFormatter()],
                suffixIcon: _extracingWithoutMaterial ? const AppLoadingIndicator() : const Icon(Icons.pin_outlined),
                onChanged: (vWithoutMaterial) {
                  final double vWithoutMaterial1 =
                      double.tryParse(vWithoutMaterial) ?? 0.0;
                  context
                      .cubit<NewGateExitCubit>()
                      .onFieldValueChanged(vWithoutMaterial: vWithoutMaterial1);
                },
              ),
              ImageSelectionWidget(
                title: 'Vehicle Weight Without Material Photo',
                initialValue: form.vechileWithoutMaterialUrl,
                readOnly: isSubmitted,
                onImage: (vWithoutImage) async {
                  if(vWithoutImage.isNull) return;
                  setState(() => _extracingWithoutMaterial = true);
                  context.cubit<NewGateExitCubit>().onFieldValueChanged(
                      vehicleWithoutMaterialPhoto: vWithoutImage);
                  final res = await _uploadImage(vWithoutImage!);
                  if(res.isSome()) {
                    final value = double.parse(res.getOrElse(() => ''));
                    context.cubit<NewGateExitCubit>().onFieldValueChanged(vWithoutMaterial: value); 
                  }
                  setState(() => _extracingWithoutMaterial = false);
                },
                icon: const Icon(Icons.local_shipping_outlined,
                    color: AppColors.white, size: 32),
              ),
              GateExitBuilder(
                buildWhen: (previous, current) =>
                    previous.form.actualWeight != current.form.actualWeight,
                builder: (_, state) => InputField(
                  title: 'Actual Weight',
                  initialValue: NumUtils.toVal(state.form.actualWeight),
                  readOnly: true,
                  inputFormatters: [UpperCaseTextFormatter()],
                  suffixIcon: const Icon(Icons.pin_outlined),
                ),
              ),
              if (!isSubmitted) ...[
                AppSpacer.p12(),
                GateExitBuilder(
                  builder: (_, state) => AppButton(
                    isLoading: state.isLoading,
                    onPressed: context.cubit<NewGateExitCubit>().processGateExit,
                    label: state.type.toName(),
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Future<dartz.Option<String>> _uploadImage(File file) async {
    try {
      const apiKey = 'AIzaSyDEgkM8hoLRdyx2vcaXQJvco6E-FWGP4Wg';

      final model = GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey);
      final fileData = await file.readAsBytes();
      final prompt = TextPart("Analyze the provided image and extract the numerical value displayed on the digital meter. The value consists of digits arranged in a horizontal sequence. The background color may be dark, and the digits may be brightly colored or have a glowing effect. Ensure accurate recognition of the highlighted digits. Return a JSON response with a status code of 200 for success (including the extracted value) or 400 for errors (including an error message)");
      final imageParts = [DataPart('image/jpeg', fileData)];

      final response = await model.generateContent([
        Content.multi([prompt, ...imageParts]),
      ]);
      final finalResponse = response.text?.replaceAll('```', "").replaceAll("json", "");
      if(finalResponse == null) return dartz.none();
      final responseMap = jsonDecode(finalResponse) as Map<String, dynamic>;
      if(responseMap['status_code'] == 200 || responseMap['status'] == 200) {
        if(responseMap.containsKey('value')) {
          return dartz.optionOf(responseMap['value'].toString());
        }
        return dartz.optionOf(responseMap['extracted_value'].toString());
      } else {
        final error = responseMap['data'].toString();
        AppDialog.showErrorDialog(context, content: error, onTapDismiss: context.exit);
      }
    } catch (e, st) {
      $logger.error('e', e, st);
    }
    return dartz.none();
  }
}
