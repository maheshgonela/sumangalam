import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/utils/attachment_selection_mixin.dart';
import 'package:sumangalam/core/utils/date_format_util.dart';
import 'package:sumangalam/core/utils/upper_case_formatter.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/gate_entry/data/gate_entry_api_helper.dart';
import 'package:sumangalam/features/gate_entry/data/static_data.dart';
import 'package:sumangalam/features/gate_entry/model/new_gate_entry_form.dart';
import 'package:sumangalam/features/gate_entry/model/po_order.dart';
import 'package:sumangalam/features/gate_entry/model/receiver_mode.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry/new_gate_entry_cubit.dart';

class GateEntryFormWidget extends StatefulWidget {
  const GateEntryFormWidget({super.key});

  @override
  State<GateEntryFormWidget> createState() => _GateEntryFormWidgetState();
}

class _GateEntryFormWidgetState extends State<GateEntryFormWidget>
    with AttahcmentSelectionMixin {
  final Map<String, TextEditingController> controllers = {
    'weight_1': TextEditingController(),
    'weight_2': TextEditingController(),
    'deliveryPerName': TextEditingController(),
    'deliveryPerMobileNo': TextEditingController(),
    'driverName': TextEditingController(),
    'driverMobileNo': TextEditingController(),
    'vehicleNo': TextEditingController(),
    'vendorInvoiceNo': TextEditingController(),
    'remarks': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    final formState = context.read<NewGateEntryCubit>().state;
    final isSubmitted = formState.type == ActionType.completed;
    final form = formState.form;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AttachmentsCubit, AttachmentsState>(
            listener: (_, state) {
              state.maybeWhen(
                orElse: () {},
                success: context.cubit<NewGateEntryCubit>().updateAttachments,
              );
            },
          ),
          BlocListener<NewGateEntryCubit, NewGateEntryState>(
            listenWhen: (p, c) => p.isSuccess != c.isSuccess,
            listener: (_, state) {
              if (state.isSuccess) {
                setState(() {});
              }
            },
          ),
        ],
        child: SpacedColumn(
          margin: const EdgeInsets.all(12.0),
          defaultHeight: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectoinHead(title: 'Vehicle IN'),
            DateSelectionField(
              title: 'Gate Entry Date',
              initialValue: form.entryDate,
              readOnly: true,
              firstDate: DFU.now().subtract(const Duration(days: 60)),
              lastDate: DFU.now(),
              onDateSelect: (date) {
              },
              suffixIcon: const Icon(Icons.calendar_month_outlined,
                  color: AppColors.catalineBlue),
            ),
            AppDropDown<String>(
              title: 'Material Type',
              hint: 'Material Type',
              readOnly: isSubmitted,
              isMandatory: true,
              defaultSelection: form.materialType,
              items: AppStaticData.materialTypes,
              onSelected: (materialType) {
                context
                    .cubit<NewGateEntryCubit>()
                    .onFieldValueChanged(materialType: materialType);
              },
              headerBuilder: (context, item, isExpanded) => Text(item),
              listItemBuilder: (context, item, isSelected, onTap) => Text(item),
              hintBuilder: (context, hint, isExpanded) => Text(hint),
            ),
            SearchDropDownList<POOrder>(
              title: 'Purchase Order No.',
              hint: 'PO Number',
              isMandatory: true,
              defaultSelection: POOrder.fromName(form.poNumber),
              readOnly: isSubmitted,
              items: const <POOrder>[],
              futureRequest: (p0) async {
                final orders = await $sl.get<PurchaseOrderHelper>().call(p0);
                return orders;
              },
              onSelected: (poNumber) {
                context.cubit<NewGateEntryCubit>().onFieldValueChanged(
                      poNumber: poNumber?.name,
                      vendorName: poNumber?.supplier,
                    );
              },
              headerBuilder: (context, item, isExpanded) => Text(item.name),
              listItemBuilder: (context, item, isSelected, onTap) =>
                  Text(item.name),
              hintBuilder: (context, hint, isExpanded) => Text(hint),
            ),
            BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
              buildWhen: (previous, current) => previous.form.vendor != current.form.vendor,
              builder: (_, state) => InputField(
                title: 'Vendor Name',
                initialValue: state.form.vendor,
                readOnly: true,
                suffixIcon: const Icon(Icons.real_estate_agent_outlined),
                onChanged: (invocieNo) {},
              ),
            ),
            AppDropDown<ReceiverMode>(
              title: 'Receive Mode',
              hint: 'Receive Mode',
              readOnly: !form.isNotSaved,
              items: ReceiverMode.values,
              defaultSelection: form.receiveMode,
              onSelected: (mode) {
                context.cubit<NewGateEntryCubit>().onFieldValueChanged(receiveMode: mode);
                setState(() {});
              },
              headerBuilder: (_, item, __) => Text(item.name),
              listItemBuilder: (_, item, __, onTap) => Text(item.name),
              hintBuilder: (_, hint, __) => Text(hint),
            ),
            
            if (form.receiveMode == ReceiverMode.byHand) ...[
              InputField(
                controller: controllers['deliveryPerName'],
                title: 'Delivery Person Name',
                initialValue: form.delivererName,
                inputType: TextInputType.text,
                onChanged: (delivererName) {
                  context
                      .cubit<NewGateEntryCubit>()
                      .onFieldValueChanged(delivererName: delivererName);
                },
              ),
              InputField(
                controller: controllers['deliveryPerMobileNo'],
                title: 'Delivery Person Mobile No.',
                initialValue: form.delivererName,
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
                inputType: TextInputType.number,
                onChanged: (mobileNo) {
                  context
                      .cubit<NewGateEntryCubit>()
                      .onFieldValueChanged(delivererMobileNo: mobileNo);
                },
              ),
            ],
            if (form.receiveMode == ReceiverMode.byVehicle) ...[
              BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
                buildWhen: (prev, curr) =>
                    prev.form.vehiclePhotoUrl != curr.form.vehiclePhotoUrl ||
                    prev.form.vehiclePhoto != curr.form.vehiclePhoto,
                builder: (context, state) => ImageSelectionWidget(
                  title: 'Vehicle Photo',
                  initialValue: state.form.vehiclePhotoUrl,
                  onImage: (vehiclePhoto) {
                    context
                        .cubit<NewGateEntryCubit>()
                        .onFieldValueChanged(vehiclePhoto: vehiclePhoto);
                  },
                  icon: const Icon(Icons.local_shipping_outlined, color: AppColors.white, size: 32),
                ),
              ),
              InputField(
                title: 'Vehicle Number',
                inputFormatters: [UpperCaseTextFormatter()],
                controller: controllers['vehicleNo'],
                initialValue: form.vehicleNo,
                suffixIcon: const Icon(Icons.pin_outlined),
                onChanged: (vehicleNo) {
                  context
                      .cubit<NewGateEntryCubit>()
                      .onFieldValueChanged(vehicleNo: vehicleNo);
                },
              ),
              InputField(
                controller: controllers['driverName'],
                title: 'Driver Name',
                inputType: TextInputType.text,
                initialValue: form.delivererName,
                suffixIcon: const Icon(Icons.person_outline),
                onChanged: (delivererName) {
                  context
                      .cubit<NewGateEntryCubit>()
                      .onFieldValueChanged(driverName: delivererName);
                },
              ),
              InputField(
                controller: controllers['driverMobileNo'],
                title: 'Driver Mobile Number',
                suffixIcon: const Icon(Icons.dialpad_outlined),
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
                inputType: TextInputType.number,
                initialValue: form.driverMobileNo,
                onChanged: (driverMobileNo) {
                  context
                      .cubit<NewGateEntryCubit>()
                      .onFieldValueChanged(driverMobileNo: driverMobileNo);
                },
              ),
              InputField(
                controller: controllers['weight_1'],
                title: 'Weight (With Material)',
                inputType: const TextInputType.numberWithOptions(decimal: true),
                initialValue: NumUtils.toVal(form.weight1),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                ],
                suffixIcon: IconButton(
                  onPressed: () async {
                    captureImage().then((value) {
                      if (value.isNull) return;

                      context
                          .cubit<NewGateEntryCubit>()
                          .onFieldValueChanged(weightPhoto: value!);
                    });
                  },
                  icon: const Icon(Icons.photo_camera_outlined),
                ),
                onChanged: (weight) {
                  context
                      .cubit<NewGateEntryCubit>()
                      .onFieldValueChanged(weight1: weight);
                },
              ),
            ],
            InputField(
              controller: controllers['vendorInvoiceNo'],
              title: 'Vendor Invoice Number',
              initialValue: form.vendorInvoiceNo,
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
                context
                    .cubit<NewGateEntryCubit>()
                    .onFieldValueChanged(vendorInvoiceDate: formattedDate);
              },
              suffixIcon: const Icon(Icons.calendar_month_outlined,
                  color: AppColors.catalineBlue),
            ),
            Visibility(
              visible: formState.form.receiveMode == ReceiverMode.byVehicle,
              child: BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
                buildWhen: (prev, curr) =>
                    prev.form.sealPhotoUrl != curr.form.sealPhotoUrl ||
                    prev.form.sealPhoto != curr.form.sealPhoto,
                builder: (_, state) => ImageSelectionWidget(
                  title: 'Seal Photo',
                  onImage: (sealPhoto) => context
                      .cubit<NewGateEntryCubit>()
                      .onFieldValueChanged(sealPhoto: sealPhoto),
                  icon: const Icon(Icons.photo_camera, color: AppColors.white),
                ),
              ),
            ),
            BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
              buildWhen: (prev, curr) =>
                  prev.form.docPhotoUrl != curr.form.docPhotoUrl ||
                  prev.form.docPhoto != curr.form.docPhoto,
              builder: (_, state) => ImageSelectionWidget(
                title: 'Document Photo',
                initialValue: state.form.docPhotoUrl,
                onImage: (docPhoto) {
                  context
                      .cubit<NewGateEntryCubit>()
                      .onFieldValueChanged(docPhoto: docPhoto);
                },
                icon: const Icon(Icons.receipt_long_outlined, color: AppColors.white),
              ),
            ),
            InputField(
              controller: controllers['weight_2'],
              title: 'Weight (With Material)',
              inputType: const TextInputType.numberWithOptions(decimal: true),
              initialValue: NumUtils.toVal(form.weight1),
              suffixIcon: IconButton(
                onPressed: () async {
                  captureImage().then((value) {
                    if (value.isNull) return;

                    context
                        .cubit<NewGateEntryCubit>()
                        .onFieldValueChanged(weightPhoto: value!);
                  });
                },
                icon: const Icon(Icons.photo_camera_outlined),
              ),
              onChanged: (weight) {
                context
                    .cubit<NewGateEntryCubit>()
                    .onFieldValueChanged(weight1: weight);
              },
            ),
            Visibility(
              visible: (formState.type != ActionType.vechileIn),
              child: SpacedColumn(
                defaultHeight: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(height: 1),
                  const SectoinHead(title: 'Unloading'),
                  BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
                    buildWhen: (prev, curr) =>
                        prev.form.unloadedPilePhotoUrl !=
                            curr.form.unloadedPilePhotoUrl ||
                        prev.form.unloadedPilePhoto !=
                            curr.form.unloadedPilePhoto,
                    builder: (context, state) => ImageSelectionWidget(
                      title: 'Unloaded Pile Photo',
                      initialValue: state.form.unloadedPilePhotoUrl,
                      onImage: (vehiclePhoto) {
                        context
                            .cubit<NewGateEntryCubit>()
                            .onFieldValueChanged(pilePhoto: vehiclePhoto);
                      },
                      icon: const Icon(Icons.photo_camera,
                          color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: (formState.type == ActionType.vechileOut ||
                  formState.type == ActionType.completed),
              child: SpacedColumn(
                defaultHeight: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(height: 1),
                  const SectoinHead(title: 'Vehicle OUT'),
                  InputField(
                    controller: controllers['weight_2'],
                    title: 'Weight (Without Material)',
                    inputType:
                        const TextInputType.numberWithOptions(decimal: true),
                    initialValue: NumUtils.toVal(form.weight1),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        captureImage().then((value) {
                          if (value.isNull) return;

                          context
                              .cubit<NewGateEntryCubit>()
                              .onFieldValueChanged(weightPhoto: value!);
                        });
                      },
                      icon: const Icon(Icons.photo_camera_outlined),
                    ),
                    onChanged: (weight) {
                      context
                          .cubit<NewGateEntryCubit>()
                          .onFieldValueChanged(weight1: weight);
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 0),
            InputField(
              title: 'Remarks',
              readOnly: isSubmitted,
              initialValue: form.remarks,
              minLines: 3,
              maxLines: 6,
              maxLength: 200,
              onChanged: (remarks) {
                context
                    .cubit<NewGateEntryCubit>()
                    .onFieldValueChanged(remarks: remarks);
              },
            ),
            AppSpacer.p12(),
            if (!isSubmitted) ...[
              BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
                builder: (_, state) => AppButton(
                  isLoading: state.isLoading,
                  onPressed:
                      context.cubit<NewGateEntryCubit>().processGateEntry,
                  label: state.type.toName(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
