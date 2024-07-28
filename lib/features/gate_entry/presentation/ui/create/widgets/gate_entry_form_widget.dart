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
import 'package:sumangalam/features/gate_entry/model/supplier.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry/new_gate_entry_cubit.dart';
import 'package:sumangalam/features/gate_entry/presentation/ui/create/widgets/gate_entry_builder.dart';

class GateEntryFormWidget extends StatefulWidget {
  const GateEntryFormWidget({super.key});

  @override
  State<GateEntryFormWidget> createState() => _GateEntryFormWidgetState();
}

class _GateEntryFormWidgetState extends State<GateEntryFormWidget>
    with AttahcmentSelectionMixin {
  final purchaseOrders = <POOrder>[];

  final Map<String, TextEditingController> controllers = {
    'weight_1': TextEditingController(), // with material
    'bill_weight': TextEditingController(), // Doc Weight
    'weight_2': TextEditingController(), // without material
    'deliveryPerName': TextEditingController(),
    'deliveryPerMobileNo': TextEditingController(),
    'driverName': TextEditingController(),
    'driverMobileNo': TextEditingController(),
    'vehicleNo': TextEditingController(),
    'vendorInvoiceNo': TextEditingController(),
    'remarks': TextEditingController(),
  };

  Future<void> _fetchInitialOrders(String name) async {
    final orders = await $sl.get<PurchaseOrderHelper>().call(name);
    setState(() {
      purchaseOrders
        ..clear()
        ..addAll(orders);
    });
  }

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
              onDateSelect: (date) {},
              suffixIcon: const Icon(Icons.calendar_month_outlined),
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
            SearchDropDownList<Supplier>(
              title: 'Supplier',
              hint: 'Supplier Name',
              isMandatory: true,
              defaultSelection: Supplier.fromName(form.vendor),
              readOnly: isSubmitted,
              items: const <Supplier>[],
              futureRequest: (p0) async {
                final supliers = await $sl.get<SupplierListHelper>().call(p0);
                return supliers;
              },
              onSelected: (poNumber) {
                context.cubit<NewGateEntryCubit>().onFieldValueChanged(
                      vendorName: poNumber?.supplier,
                    );
                _fetchInitialOrders(poNumber!.supplier);
              },
              headerBuilder: (context, item, isExpanded) => Text(item.supplier),
              listItemBuilder: (context, item, isSelected, onTap) =>
                  Text(item.supplier),
              hintBuilder: (context, hint, isExpanded) => Text(hint),
            ),
            GateEntryBuilder(
              buildWhen: (p, c) => p.form.isPOAvailable != c.form.isPOAvailable,
              builder: (_, state) {
                return Column(
                  children: [
                    CheckboxListTile(
                      activeColor: Colors.black,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      isThreeLine: false,
                      dense: true,
                      enabled: isSubmitted.isFalse,
                      contentPadding: EdgeInsets.zero,
                      value: state.form.isPOAvailable.isTrue,
                      title: const CaptionText(
                          title: 'Is PO Available', isRequired: false),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        context.cubit<NewGateEntryCubit>().onFieldValueChanged(
                              isPOAvailable: value,
                            );
                      },
                    ),
                    if (state.form.isPOAvailable.isTrue) ...[
                      SearchDropDownList<POOrder>(
                        title: 'Purchase Order No.',
                        hint: 'PO Number',
                        isMandatory: true,
                        defaultSelection: POOrder.fromName(form.poNumber),
                        readOnly: isSubmitted,
                        items: purchaseOrders,
                        futureRequest: (p0) async {
                          final orders =
                              await $sl.get<PurchaseOrderHelper>().call(p0);
                          setState(() {
                            purchaseOrders
                              ..clear()
                              ..addAll(orders);
                          });
                          return orders;
                        },
                        onSelected: (poNumber) {
                          context
                              .cubit<NewGateEntryCubit>()
                              .onFieldValueChanged(
                                poNumber: poNumber?.name,
                              );
                        },
                        headerBuilder: (context, item, isExpanded) =>
                            Text(item.name),
                        listItemBuilder: (context, item, isSelected, onTap) =>
                            Text(item.name),
                        hintBuilder: (context, hint, isExpanded) => Text(hint),
                      ),
                    ],
                  ],
                );
              },
            ),
            AppDropDown<ReceiverMode>(
              title: 'Receive Mode',
              hint: 'Receive Mode',
              readOnly: !form.isNotSaved,
              items: ReceiverMode.values,
              defaultSelection: form.receiveMode,
              onSelected: (mode) {
                context
                    .cubit<NewGateEntryCubit>()
                    .onFieldValueChanged(receiveMode: mode);
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
                readOnly: isSubmitted,
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
                readOnly: isSubmitted,
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
              GateEntryBuilder(
                buildWhen: (prev, curr) =>
                    prev.form.vehiclePhotoUrl != curr.form.vehiclePhotoUrl ||
                    prev.form.vehiclePhoto != curr.form.vehiclePhoto,
                builder: (context, state) => ImageSelectionWidget(
                  title: 'Vehicle Photo',
                  readOnly: isSubmitted,
                  initialValue: state.form.vehiclePhotoUrl,
                  onImage: (vehiclePhoto) {
                    context
                        .cubit<NewGateEntryCubit>()
                        .onFieldValueChanged(vehiclePhoto: vehiclePhoto);
                  },
                  icon: const Icon(Icons.local_shipping_outlined,
                      color: AppColors.white, size: 32),
                ),
              ),
              InputField(
                title: 'Vehicle Number',
                readOnly: isSubmitted,
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
                readOnly: isSubmitted,
                inputType: TextInputType.text,
                initialValue: form.driverName,
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
                readOnly: isSubmitted,
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
            ],
            InputField(
              controller: controllers['vendorInvoiceNo'],
              title: 'Vendor Invoice Number',
              initialValue: form.vendorInvoiceNo,
              inputFormatters: [UpperCaseTextFormatter()],
              readOnly: isSubmitted,
              onChanged: (invocieNo) {
                context
                    .cubit<NewGateEntryCubit>()
                    .onFieldValueChanged(vendorInvoiceNo: invocieNo);
              },
            ),
            DateSelectionField(
              title: 'Vendor Invoice Date',
              readOnly: isSubmitted,
              initialValue: form.vendorInvoiceDate,
              firstDate: DFU.now().subtract(const Duration(days: 60)),
              lastDate: DFU.now(),
              onDateSelect: (date) {
                final formattedDate = DFU.friendlyFormat(date);
                context
                    .cubit<NewGateEntryCubit>()
                    .onFieldValueChanged(vendorInvoiceDate: formattedDate);
              },
              suffixIcon: const Icon(Icons.calendar_month_outlined),
            ),
            Visibility(
              visible: formState.form.receiveMode == ReceiverMode.byVehicle,
              child: BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
                buildWhen: (prev, curr) =>
                    prev.form.sealPhotoUrl != curr.form.sealPhotoUrl ||
                    prev.form.sealPhoto != curr.form.sealPhoto,
                builder: (_, state) => ImageSelectionWidget(
                  title: 'Seal Tag Photo',
                  initialValue: state.form.sealPhotoUrl,
                  onImage: (sealPhoto) => context
                      .cubit<NewGateEntryCubit>()
                      .onFieldValueChanged(sealPhoto: sealPhoto),
                  icon: const Icon(Icons.photo_camera, color: AppColors.white),
                ),
              ),
            ),
            GateEntryBuilder(
              buildWhen: (prev, curr) =>
                  prev.form.docPhotoUrl != curr.form.docPhotoUrl ||
                  prev.form.docPhoto != curr.form.docPhoto,
              builder: (_, state) => ImageSelectionWidget(
                title: 'Document Photo',
                readOnly: isSubmitted,
                initialValue: state.form.docPhotoUrl,
                onImage: (docPhoto) {
                  context
                      .cubit<NewGateEntryCubit>()
                      .onFieldValueChanged(docPhoto: docPhoto);
                },
                icon: const Icon(Icons.receipt_long_outlined,
                    color: AppColors.white),
              ),
            ),
            InputField(
              controller: controllers['weight_1'],
              title: 'Weight (With Material in KGs)',
              readOnly: isSubmitted,
              inputType: const TextInputType.numberWithOptions(decimal: true),
              initialValue: NumUtils.toVal(form.weight1),
              suffixIcon: GateEntryBuilder(
                builder: (_, state) {
                  final isAttached = state.form.weight1Photo.isNotNull ||
                      state.form.weight1Url.isNotNull;
                  return IconButton(
                    onPressed: () async {
                      captureImage().then((value) {
                        if (value.isNull) return;

                        context
                            .cubit<NewGateEntryCubit>()
                            .onFieldValueChanged(weightPhoto: value!);
                      });
                    },
                    icon: Icon(Icons.photo_camera_outlined,
                        color:
                            isAttached ? AppColors.blue : AppColors.black),
                  );
                },
              ),
              onChanged: (weight) {
                context
                    .cubit<NewGateEntryCubit>()
                    .onFieldValueChanged(weight1: weight);
              },
            ),
            InputField(
              controller: controllers['bill_weight'],
              title: 'Document Weight (in KGs)',
              readOnly: isSubmitted,
              inputType: const TextInputType.numberWithOptions(decimal: true),
              initialValue: form.documentWeight,
              onChanged: (weight) {
                context
                    .cubit<NewGateEntryCubit>()
                    .onFieldValueChanged(documentWeight: weight);
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
                  GateEntryBuilder(
                    buildWhen: (prev, curr) =>
                        prev.form.unloadedPilePhotoUrl !=
                            curr.form.unloadedPilePhotoUrl ||
                        prev.form.unloadedPilePhoto !=
                            curr.form.unloadedPilePhoto,
                    builder: (context, state) => ImageSelectionWidget(
                      title: 'Unloaded Pile Photo',
                      readOnly: isSubmitted,
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
                    title: 'Weight (Without Material in KGs)',
                    readOnly: isSubmitted,
                    inputType:
                        const TextInputType.numberWithOptions(decimal: true),
                    initialValue: NumUtils.toVal(form.weight2),
                    suffixIcon: GateEntryBuilder(
                      builder: (context, state) {
                        final isAttached = state.form.weight2Photo.isNotNull ||
                            state.form.weight2PhotoUrl.isNotNull;
                        return IconButton(
                          onPressed: () async {
                            captureImage().then((value) {
                              if (value.isNull) return;

                              context
                                  .cubit<NewGateEntryCubit>()
                                  .onFieldValueChanged(weight2Photo: value!);
                            });
                          },
                          icon: Icon(Icons.photo_camera_outlined, color: isAttached ? AppColors.blue : AppColors.black),
                        );
                      },
                    ),
                    onChanged: (weight) {
                      context
                          .cubit<NewGateEntryCubit>()
                          .onFieldValueChanged(weight2: weight);
                    },
                  ),
                  GateEntryBuilder(
                    buildWhen: (previous, current) => previous.form.actualWeight !=
                        current.form.actualWeight,
                    builder: (_, state) {
                      return InputField(
                        title: 'Actual Weight (in KGs)',
                        readOnly: true,
                        initialValue: NumUtils.toVal(state.form.actualWeight),
                      );
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
              GateEntryBuilder(
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
