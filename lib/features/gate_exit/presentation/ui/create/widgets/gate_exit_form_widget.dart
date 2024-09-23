import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/utils/attachment_selection_mixin.dart';
import 'package:sumangalam/core/utils/upper_case_formatter.dart';
import 'package:sumangalam/core/widgets/app_spacer.dart';
import 'package:sumangalam/core/widgets/date_selection_field.dart';
import 'package:sumangalam/core/widgets/image_selection_widget.dart';
import 'package:sumangalam/core/widgets/input_filed.dart';
import 'package:sumangalam/core/widgets/primary_btn.dart';
import 'package:sumangalam/core/widgets/search_dropdown_widget.dart';
import 'package:sumangalam/core/widgets/spaced_column.dart';
import 'package:sumangalam/features/gate_exit/data/gate_exit_api_helper.dart';
import 'package:sumangalam/features/gate_exit/model/delivery_note.dart';
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
  final shipments = <DeliveryNote>[];

  @override
  void initState() {
    super.initState();
    _fetchShipments();
  }

  final Map<String, TextEditingController> controllers = {
    'vehicleNo': TextEditingController(),
    'driverMobileNo': TextEditingController(),
    'driverName': TextEditingController(),
  };
  Future<void> _fetchShipments() async {
    final orders = await $sl.get<ShipmentListHelper>().call();
    setState(() {
      shipments
        ..clear()
        ..addAll(orders);
    });
  }

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
          defaultHeight: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateSelectionField(
              title: 'Gate Exit Date',
              initialValue: form.exitdate,
              readOnly: true,
              firstDate: DFU.now(),
              lastDate: DFU.now(),
              onDateSelect: (date) {},
              suffixIcon: const Icon(Icons.calendar_month_outlined),
            ),
            InputField(
              title: 'Created Time',
              readOnly: true,
              initialValue: form.createdtime,
            ),
            SearchDropDownList<DeliveryNote>(
              title: 'DC No.',
              hint: 'Select DC No.',
              readOnly: isSubmitted,
              defaultSelection: DeliveryNote.fromEntry(form),
              items: shipments,
              futureRequest: (p0) async {
                final orders = await $sl.get<ShipmentListHelper>().call(p0);
                setState(() {
                  shipments
                    ..clear()
                    ..addAll(orders);
                });
                return orders;
              },
              onSelected: (dcNo) {
                context.cubit<NewGateExitCubit>().onFieldValueChanged(
                      dcNO: dcNo?.name,
                      customerName: dcNo?.customerName,
                      sONO: dcNo?.soNo,
                      poNumber: dcNo?.poNumber,
                    );
                setState(() {
                  controllers['customerName']?.text = dcNo?.customerName ?? '';
                  controllers['sONO']?.text = dcNo?.soNo ?? '';
                  controllers['poNumber']?.text = dcNo?.poNumber ?? '';
                });
              },
              headerBuilder: (context, item, isExpanded) =>
                  Text(item.name),
              listItemBuilder: (context, item, isSelected, onTap) =>
                  Text(item.name),
              hintBuilder: (context, hint, isExpanded) => Text(hint),
            ),
            if(form.dcNo.isNotNull)...[
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
        ),
      ),
    );
  }
}
