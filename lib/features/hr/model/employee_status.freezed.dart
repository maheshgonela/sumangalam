// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmployeeStatus _$EmployeeStatusFromJson(Map<String, dynamic> json) {
  return _EmployeeStatus.fromJson(json);
}

/// @nodoc
mixin _$EmployeeStatus {
  @JsonKey(name: 'employee')
  String get employee => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_name')
  String get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_id')
  String get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_checkin_id')
  String get employeeCheckinId => throw _privateConstructorUsedError;
  @JsonKey(name: 'log_type')
  String get logType => throw _privateConstructorUsedError;
  @JsonKey(name: 'punch_in_time')
  String get punchInTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_status')
  String get customStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_selfie')
  String? get customSelfie => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_location_')
  String? get customLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'punch_date')
  String get punchDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_reject_reason', defaultValue: '')
  String get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeStatusCopyWith<EmployeeStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeStatusCopyWith<$Res> {
  factory $EmployeeStatusCopyWith(
          EmployeeStatus value, $Res Function(EmployeeStatus) then) =
      _$EmployeeStatusCopyWithImpl<$Res, EmployeeStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'employee') String employee,
      @JsonKey(name: 'employee_name') String employeeName,
      @JsonKey(name: 'employee_id') String employeeId,
      @JsonKey(name: 'employee_checkin_id') String employeeCheckinId,
      @JsonKey(name: 'log_type') String logType,
      @JsonKey(name: 'punch_in_time') String punchInTime,
      @JsonKey(name: 'custom_status') String customStatus,
      @JsonKey(name: 'custom_selfie') String? customSelfie,
      @JsonKey(name: 'custom_location_') String? customLocation,
      @JsonKey(name: 'punch_date') String punchDate,
      @JsonKey(name: 'custom_reject_reason', defaultValue: '') String reason});
}

/// @nodoc
class _$EmployeeStatusCopyWithImpl<$Res, $Val extends EmployeeStatus>
    implements $EmployeeStatusCopyWith<$Res> {
  _$EmployeeStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employee = null,
    Object? employeeName = null,
    Object? employeeId = null,
    Object? employeeCheckinId = null,
    Object? logType = null,
    Object? punchInTime = null,
    Object? customStatus = null,
    Object? customSelfie = freezed,
    Object? customLocation = freezed,
    Object? punchDate = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeCheckinId: null == employeeCheckinId
          ? _value.employeeCheckinId
          : employeeCheckinId // ignore: cast_nullable_to_non_nullable
              as String,
      logType: null == logType
          ? _value.logType
          : logType // ignore: cast_nullable_to_non_nullable
              as String,
      punchInTime: null == punchInTime
          ? _value.punchInTime
          : punchInTime // ignore: cast_nullable_to_non_nullable
              as String,
      customStatus: null == customStatus
          ? _value.customStatus
          : customStatus // ignore: cast_nullable_to_non_nullable
              as String,
      customSelfie: freezed == customSelfie
          ? _value.customSelfie
          : customSelfie // ignore: cast_nullable_to_non_nullable
              as String?,
      customLocation: freezed == customLocation
          ? _value.customLocation
          : customLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      punchDate: null == punchDate
          ? _value.punchDate
          : punchDate // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeStatusImplCopyWith<$Res>
    implements $EmployeeStatusCopyWith<$Res> {
  factory _$$EmployeeStatusImplCopyWith(_$EmployeeStatusImpl value,
          $Res Function(_$EmployeeStatusImpl) then) =
      __$$EmployeeStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'employee') String employee,
      @JsonKey(name: 'employee_name') String employeeName,
      @JsonKey(name: 'employee_id') String employeeId,
      @JsonKey(name: 'employee_checkin_id') String employeeCheckinId,
      @JsonKey(name: 'log_type') String logType,
      @JsonKey(name: 'punch_in_time') String punchInTime,
      @JsonKey(name: 'custom_status') String customStatus,
      @JsonKey(name: 'custom_selfie') String? customSelfie,
      @JsonKey(name: 'custom_location_') String? customLocation,
      @JsonKey(name: 'punch_date') String punchDate,
      @JsonKey(name: 'custom_reject_reason', defaultValue: '') String reason});
}

/// @nodoc
class __$$EmployeeStatusImplCopyWithImpl<$Res>
    extends _$EmployeeStatusCopyWithImpl<$Res, _$EmployeeStatusImpl>
    implements _$$EmployeeStatusImplCopyWith<$Res> {
  __$$EmployeeStatusImplCopyWithImpl(
      _$EmployeeStatusImpl _value, $Res Function(_$EmployeeStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employee = null,
    Object? employeeName = null,
    Object? employeeId = null,
    Object? employeeCheckinId = null,
    Object? logType = null,
    Object? punchInTime = null,
    Object? customStatus = null,
    Object? customSelfie = freezed,
    Object? customLocation = freezed,
    Object? punchDate = null,
    Object? reason = null,
  }) {
    return _then(_$EmployeeStatusImpl(
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      employeeCheckinId: null == employeeCheckinId
          ? _value.employeeCheckinId
          : employeeCheckinId // ignore: cast_nullable_to_non_nullable
              as String,
      logType: null == logType
          ? _value.logType
          : logType // ignore: cast_nullable_to_non_nullable
              as String,
      punchInTime: null == punchInTime
          ? _value.punchInTime
          : punchInTime // ignore: cast_nullable_to_non_nullable
              as String,
      customStatus: null == customStatus
          ? _value.customStatus
          : customStatus // ignore: cast_nullable_to_non_nullable
              as String,
      customSelfie: freezed == customSelfie
          ? _value.customSelfie
          : customSelfie // ignore: cast_nullable_to_non_nullable
              as String?,
      customLocation: freezed == customLocation
          ? _value.customLocation
          : customLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      punchDate: null == punchDate
          ? _value.punchDate
          : punchDate // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeStatusImpl implements _EmployeeStatus {
  const _$EmployeeStatusImpl(
      {@JsonKey(name: 'employee') required this.employee,
      @JsonKey(name: 'employee_name') required this.employeeName,
      @JsonKey(name: 'employee_id') required this.employeeId,
      @JsonKey(name: 'employee_checkin_id') required this.employeeCheckinId,
      @JsonKey(name: 'log_type') required this.logType,
      @JsonKey(name: 'punch_in_time') required this.punchInTime,
      @JsonKey(name: 'custom_status') required this.customStatus,
      @JsonKey(name: 'custom_selfie') this.customSelfie,
      @JsonKey(name: 'custom_location_') this.customLocation,
      @JsonKey(name: 'punch_date') required this.punchDate,
      @JsonKey(name: 'custom_reject_reason', defaultValue: '')
      required this.reason});

  factory _$EmployeeStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeStatusImplFromJson(json);

  @override
  @JsonKey(name: 'employee')
  final String employee;
  @override
  @JsonKey(name: 'employee_name')
  final String employeeName;
  @override
  @JsonKey(name: 'employee_id')
  final String employeeId;
  @override
  @JsonKey(name: 'employee_checkin_id')
  final String employeeCheckinId;
  @override
  @JsonKey(name: 'log_type')
  final String logType;
  @override
  @JsonKey(name: 'punch_in_time')
  final String punchInTime;
  @override
  @JsonKey(name: 'custom_status')
  final String customStatus;
  @override
  @JsonKey(name: 'custom_selfie')
  final String? customSelfie;
  @override
  @JsonKey(name: 'custom_location_')
  final String? customLocation;
  @override
  @JsonKey(name: 'punch_date')
  final String punchDate;
  @override
  @JsonKey(name: 'custom_reject_reason', defaultValue: '')
  final String reason;

  @override
  String toString() {
    return 'EmployeeStatus(employee: $employee, employeeName: $employeeName, employeeId: $employeeId, employeeCheckinId: $employeeCheckinId, logType: $logType, punchInTime: $punchInTime, customStatus: $customStatus, customSelfie: $customSelfie, customLocation: $customLocation, punchDate: $punchDate, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeStatusImpl &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeCheckinId, employeeCheckinId) ||
                other.employeeCheckinId == employeeCheckinId) &&
            (identical(other.logType, logType) || other.logType == logType) &&
            (identical(other.punchInTime, punchInTime) ||
                other.punchInTime == punchInTime) &&
            (identical(other.customStatus, customStatus) ||
                other.customStatus == customStatus) &&
            (identical(other.customSelfie, customSelfie) ||
                other.customSelfie == customSelfie) &&
            (identical(other.customLocation, customLocation) ||
                other.customLocation == customLocation) &&
            (identical(other.punchDate, punchDate) ||
                other.punchDate == punchDate) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      employee,
      employeeName,
      employeeId,
      employeeCheckinId,
      logType,
      punchInTime,
      customStatus,
      customSelfie,
      customLocation,
      punchDate,
      reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeStatusImplCopyWith<_$EmployeeStatusImpl> get copyWith =>
      __$$EmployeeStatusImplCopyWithImpl<_$EmployeeStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeStatusImplToJson(
      this,
    );
  }
}

abstract class _EmployeeStatus implements EmployeeStatus {
  const factory _EmployeeStatus(
      {@JsonKey(name: 'employee') required final String employee,
      @JsonKey(name: 'employee_name') required final String employeeName,
      @JsonKey(name: 'employee_id') required final String employeeId,
      @JsonKey(name: 'employee_checkin_id')
      required final String employeeCheckinId,
      @JsonKey(name: 'log_type') required final String logType,
      @JsonKey(name: 'punch_in_time') required final String punchInTime,
      @JsonKey(name: 'custom_status') required final String customStatus,
      @JsonKey(name: 'custom_selfie') final String? customSelfie,
      @JsonKey(name: 'custom_location_') final String? customLocation,
      @JsonKey(name: 'punch_date') required final String punchDate,
      @JsonKey(name: 'custom_reject_reason', defaultValue: '')
      required final String reason}) = _$EmployeeStatusImpl;

  factory _EmployeeStatus.fromJson(Map<String, dynamic> json) =
      _$EmployeeStatusImpl.fromJson;

  @override
  @JsonKey(name: 'employee')
  String get employee;
  @override
  @JsonKey(name: 'employee_name')
  String get employeeName;
  @override
  @JsonKey(name: 'employee_id')
  String get employeeId;
  @override
  @JsonKey(name: 'employee_checkin_id')
  String get employeeCheckinId;
  @override
  @JsonKey(name: 'log_type')
  String get logType;
  @override
  @JsonKey(name: 'punch_in_time')
  String get punchInTime;
  @override
  @JsonKey(name: 'custom_status')
  String get customStatus;
  @override
  @JsonKey(name: 'custom_selfie')
  String? get customSelfie;
  @override
  @JsonKey(name: 'custom_location_')
  String? get customLocation;
  @override
  @JsonKey(name: 'punch_date')
  String get punchDate;
  @override
  @JsonKey(name: 'custom_reject_reason', defaultValue: '')
  String get reason;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeStatusImplCopyWith<_$EmployeeStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
