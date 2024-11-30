import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/cubit/location/geo_location_cubit.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/hr/presentation/bloc/new_on_duty/new_on_duty_cubit.dart';

class OnDutyFormWidget extends StatefulWidget {
  const OnDutyFormWidget({super.key});

  @override
  State<OnDutyFormWidget> createState() => _OnDutyFormWidgetState();
}

class _OnDutyFormWidgetState extends State<OnDutyFormWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.cubit<NewOnDutyCubit>();
    return SpacedColumn(
      margin: const EdgeInsets.all(12.0),
      defaultHeight: 12.0,
      children: [
        InputField(
          title: 'Time',
          readOnly: true,
          initialValue: cubit.state.form.time,
        ),
        ImageSelectionWidget(
          onImage: (file) => cubit.onUpdate(selfie: file),
          title: 'Live Selfie',
          icon: const Center(
            child: Icon(Icons.camera_alt, size: 40, color: Colors.white),
          ),
        ),
        InputField(
          title: 'Customer Details',
          hintText: 'Enter Customer Details',
          onChanged: (p0) => cubit.onUpdate(customer: p0),
        ),
        AppDropDown(
          title: 'Log Type',
          items: const ['IN', 'OUT'],
          hint: 'Select Log Type',
          onSelected: (p0) => cubit.onUpdate(logType: p0),
        ),
        InputField(
          title: 'Type',
          readOnly: true,
          initialValue: 'On Duty',
        ),
        BlocBuilder<GeoLocationCubit, GeoLocationState>(
          builder: (_, state) {
            final fullAddress = getCoordinates(state);
            cubit.onUpdate(location: fullAddress);
            return InputField(
              prefixIcon: state.isLoading && !state.isSuccess
                  ? const Center(child: AppLoadingIndicator())
                  : null,
              title: 'GPS Coordinates',
              initialValue: fullAddress,
              readOnly: true,
            );
          },
        ),
        BlocBuilder<GeoLocationCubit, GeoLocationState>(
          builder: (_, state) {
            final fullAddress = formatAddress(state);
            return InputField(
              title: 'Location Name',
              initialValue: fullAddress,
              readOnly: true,
            );
          },
        ),
        InputField(
          title: 'Purpose',
          hintText: 'Enter Purpose',
          minLines: 2,
          maxLines: 2,
          onChanged: (p0) => cubit.onUpdate(purpose: p0),
        ),
        InputField(
          title: 'Remarks',
          hintText: 'Enter Remarks',
          minLines: 3,
          maxLines: 3,
          onChanged: (p0) => cubit.onUpdate(remarks: p0),
        ),
        BlocBuilder<NewOnDutyCubit, NewOnDutyState>(
          builder: (_, state) => AppButton(
            isLoading: state.isLoading,
            label: 'SUBMIT',
            onPressed: cubit.submitForm,
          ),
        ),
      ],
    );
  }
}
