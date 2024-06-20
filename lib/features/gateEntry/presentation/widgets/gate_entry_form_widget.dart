import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/utils/date_format_util.dart';
import 'package:sumangalam/core/widgets/app_dropdown.dart';
import 'package:sumangalam/core/widgets/date_selection_field.dart';
import 'package:sumangalam/core/widgets/input_filed.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/gateEntry/model/receiver_mode.dart';
import 'package:sumangalam/features/gateEntry/presentation/ui/create/cubit/new_gate_entry_cubit.dart';
import 'package:sumangalam/features/gateEntry/presentation/widgets/gate_entry_image_widget.dart';

const List<String> vehicleTypes = [
  'Truck',
  'Van',
  'SUV',
  'Sedan',
  'Motorbike',
  'Bicycle',
  'Tractor',
];

class GateEntryFormWidget extends StatefulWidget {
  const GateEntryFormWidget({super.key});

  @override
  State<GateEntryFormWidget> createState() => _GateEntryFormWidgetState();
}

class _GateEntryFormWidgetState extends State<GateEntryFormWidget> {
  final DateTime now = DateTime.now();
  final Map<String, TextEditingController> controllers = {
    'delivereName': TextEditingController(),
    'delivererMobileNo': TextEditingController(),
    'vehicleNo': TextEditingController(),
    'deliverName': TextEditingController(),
    'driverMobileNo': TextEditingController(),
    'vendorInvoiceNo': TextEditingController(),
    'remarks': TextEditingController(),
  };
  @override
  Widget build(BuildContext context) {
    // final String formattedTime = DateFormat('HH:mm:ss').format(now);
    final formState = context.read<NewGateEntryCubit>().state;
    final form = formState.form;
    return SingleChildScrollView(
      child: SpacedColumn(
        margin: const EdgeInsets.all(12.0),
        defaultHeight: 8,
        children: [
         DateSelectionField(
                      
                      title: 'Gate Entry Date',
                      initialValue: form.creationDate,
                      firstDate: DFU.now().subtract(const Duration(days: 60)),
                      lastDate: DFU.now(),
                      onDateSelect: (date) {
                        final formattedDate = DFU.friendlyFormat(date);
                        context.cubit<NewGateEntryCubit>().onFieldValueChanged(
                            creationDate: formattedDate);
                      },
                      borderColor: AppColors.catalineBlue,
                      suffixIcon: const Icon(Icons.calendar_month_outlined,
                          color: AppColors.catalineBlue),
                    ),
          // InputField(
          //   readOnly: true,
          //   fieldColor: AppColors.paleAqua,
          //   initialValue: formattedTime,
          //   title: 'Created Time',
          //   borderColor: AppColors.catalineBlue,
          // ),
          AppDropDown<String>(
            title: 'Material Type',
            hint: 'Material Type',
            defaultSelection: form.materialType,
            items: vehicleTypes,
            onSelected: (materialType) {
              context
                  .cubit<NewGateEntryCubit>()
                  .onFieldValueChanged(materialType: materialType);
            },
            closedFillColor: AppColors.white,
            headerBuilder: (context, item, isExpanded) => Text(item),
            listItemBuilder: (context, item, isSelected, onTap) => Text(item),
            hintBuilder: (context, hint, isExpanded) => Text(hint),
          ),
          AppDropDown<String>(
            title: 'Venor Name',
            hint: 'Vendor Name',
            defaultSelection: form.vendorName,
            items: vehicleTypes,
            onSelected: (vendorName) {
              context
                  .cubit<NewGateEntryCubit>()
                  .onFieldValueChanged(vendorName: vendorName);
            },
            closedFillColor: AppColors.white,
            headerBuilder: (context, item, isExpanded) => Text(item),
            listItemBuilder: (context, item, isSelected, onTap) => Text(item),
            hintBuilder: (context, hint, isExpanded) => Text(hint),
          ),
          AppDropDown<String>(
            title: 'PO  Number',
            hint: 'PO Number',
            defaultSelection: form.poNumber,
            items: vehicleTypes,
            onSelected: (poNumber) {
              context
                  .cubit<NewGateEntryCubit>()
                  .onFieldValueChanged(poNumber: poNumber);
            },
            closedFillColor: AppColors.white,
            headerBuilder: (context, item, isExpanded) => Text(item),
            listItemBuilder: (context, item, isSelected, onTap) => Text(item),
            hintBuilder: (context, hint, isExpanded) => Text(hint),
          ),
          BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
            builder: (context, state) {
              return SpacedColumn(
                defaultHeight: 4.0,
                children: [
                  AppDropDown<ReceiverMode>(
                    title: 'Receive Mode',
                    hint: 'Receive Mode',
                    items: ReceiverMode.values,
                    onSelected: (mode) {
                      context.cubit<NewGateEntryCubit>().onModeChange(mode!);
                    },
                    closedFillColor: AppColors.white,
                    headerBuilder: (context, item, isExpanded) =>
                        Text(item.name),
                    listItemBuilder: (context, item, isSelected, onTap) =>
                        Text(item.name),
                    hintBuilder: (context, hint, isExpanded) => Text(hint),
                  ),
                  if (state.form.receiveMode == ReceiverMode.byHand) ...[
                    InputField(
                      controller: controllers['delivereName'],
                      title: 'Deliverer Name',
                      initialValue: state.form.delivererName,
                      inputType: TextInputType.text,
                      borderColor: AppColors.catalineBlue,
                      onChanged: (delivererName) {
                        context
                            .cubit<NewGateEntryCubit>()
                            .onFieldValueChanged(delivererName: delivererName);
                      },
                    ),
                    InputField(
                      controller: controllers['delivererMobileNo'],
                      title: 'Deliverer Mobile Number',
                      initialValue: state.form.delivererMobileNo,
                      borderColor: AppColors.catalineBlue,
                      inputType: TextInputType.number,
                      onChanged: (delivererMobileNo) {
                        // context.cubit<NewGateEntryCubit>().onFieldValueChanged(
                        //     delivererMobileNo: delivererMobileNo);
                      },
                    ),
                  ] else if (state.form.receiveMode ==
                      ReceiverMode.byVehicle) ...[
                    BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
                      buildWhen: (prev, curr) =>
                          prev.form.vehiclePhoto != curr.form.vehiclePhoto,
                      builder: (context, state) {
                        return ImageSelectionWidget(
                          captionTitle: 'Vehicle Photo',
                          onImage: (vehiclePhoto) {
                            context
                                .cubit<NewGateEntryCubit>()
                                .onFieldValueChanged(
                                    vehiclePhoto: vehiclePhoto);
                          },
                          fieldColor: AppColors.dodgerBlue,
                          icon: const Icon(
                            Icons.photo_camera,
                            color: AppColors.white,
                          ),
                        );
                      },
                    ),
                    InputField(
                      title: 'Vehicle Number',
                      inputType: TextInputType.number,
                      controller: controllers['vehicleNo'],
                      borderColor: AppColors.catalineBlue,
                      initialValue: form.vehicleNo,
                      onChanged: (vehicleNo) {
                        context
                            .cubit<NewGateEntryCubit>()
                            .onFieldValueChanged(vehicleNo: vehicleNo);
                      },
                    ),
                    InputField(
                      controller: controllers['deliverName'],
                      title: 'Driver Name',
                      inputType: TextInputType.text,
                      initialValue: form.delivererName,
                      borderColor: AppColors.catalineBlue,
                      onChanged: (delivererName) {
                        context
                            .cubit<NewGateEntryCubit>()
                            .onFieldValueChanged(delivererName: delivererName);
                      },
                    ),
                    InputField(
                      controller: controllers['driverMobileNo'],
                      title: 'Driver Mobile Number',
                      inputType: TextInputType.number,
                      initialValue: form.delivererMobileNo,
                      borderColor: AppColors.catalineBlue,
                      onChanged: (driverMobileNo) {
                        context.cubit<NewGateEntryCubit>().onFieldValueChanged(
                            driverMobileNo: driverMobileNo);
                      },
                    ),
                    InputField(
                      controller: controllers['vendorInvoiceNo'],
                      title: 'Vendor Invoice Number',
                      initialValue: form.vendorInvoiceNo,
                      borderColor: AppColors.catalineBlue,
                      inputType: TextInputType.number,
                      onChanged: (invocieNo) {
                        context
                            .cubit<NewGateEntryCubit>()
                            .onFieldValueChanged(vendorInvoiceNo: invocieNo);
                      },
                    ),
                    DateSelectionField(
                      
                      title: 'Vendor Invoice Date',
                      initialValue: form.vendorInvoiceDate,
                      firstDate: DFU.now().subtract(const Duration(days: 60)),
                      lastDate: DFU.now(),
                      onDateSelect: (date) {
                        final formattedDate = DFU.friendlyFormat(date);
                        context.cubit<NewGateEntryCubit>().onFieldValueChanged(
                            vendorInvoiceDate: formattedDate);
                      },
                      borderColor: AppColors.catalineBlue,
                      suffixIcon: const Icon(Icons.calendar_month_outlined,
                          color: AppColors.catalineBlue),
                    ),
                    BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
                      buildWhen: (prev, curr) =>
                          prev.form.sealPhoto != curr.form.sealPhoto,
                      builder: (_, state) {
                        return ImageSelectionWidget(
                          captionTitle: 'Seal Photo',
                          onImage: (sealPhoto) {
                            context
                                .cubit<NewGateEntryCubit>()
                                .onFieldValueChanged(sealPhoto: sealPhoto);
                          },
                          fieldColor: AppColors.dodgerBlue,
                          icon: const Icon(
                            Icons.photo_camera,
                            color: AppColors.white,
                          ),
                        );
                      },
                    ),
                    BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
                      buildWhen: (prev, curr) =>
                          prev.form.weightPhoto != curr.form.weightPhoto,
                      builder: (context, state) {
                        return ImageSelectionWidget(
                          captionTitle: 'Weight Photo',
                          onImage: (weightPhoto) {
                            context
                                .cubit<NewGateEntryCubit>()
                                .onFieldValueChanged(weightPhoto: weightPhoto);
                          },
                          fieldColor: AppColors.white,
                          iconAlignment: Alignment.centerRight,
                          icon: const Icon(
                            Icons.photo_camera,
                            color: AppColors.black,
                          ),
                        );
                      },
                    ),
                  ],
                ],
              );
            },
          ),
          BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
            buildWhen: (prev, curr) => prev.form.docPhoto != curr.form.docPhoto,
            builder: (context, state) {
              return ImageSelectionWidget(
                captionTitle: 'Document Photo',
                onImage: (docPhoto) {
                  context
                      .cubit<NewGateEntryCubit>()
                      .onFieldValueChanged(docPhoto: docPhoto);
                },
                fieldColor: AppColors.dodgerBlue,
                icon: const Icon(
                  Icons.photo_camera,
                  color: AppColors.white,
                ),
              );
            },
          ),
          InputField(
            title: 'Remarks',
            initialValue: form.remarks,
            borderColor: AppColors.catalineBlue,
            minLines: 6,
            maxLines: 6,
            maxLength: 200,
            onChanged: (remarks) {
              context
                  .cubit<NewGateEntryCubit>()
                  .onFieldValueChanged(remarks: remarks);
            },
          ),
          AppSpacer.p12(),
          BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
            builder: (_, state) {
              print(state);
              return PrimaryBtn(
                  isloading: state.isLoading,
                  enabled: true,
                  onPressed: () {
                    print(state);
                    context.cubit<NewGateEntryCubit>().create();
                  },
                  title: 'Submit');
            },
          )
        ],
      ),
    );
  }
}
