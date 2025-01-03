// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return _Employee.fromJson(json);
}

/// @nodoc
mixin _$Employee {
  @JsonKey(name: 'employee_checkin_id')
  String get checkInId => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_id')
  String get empId => throw _privateConstructorUsedError;
  @JsonKey(name: 'log_type')
  String get logType => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_name')
  String get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'punch_in_time')
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_status')
  String get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift_type')
  String get shift => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_location_')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_selfie')
  String? get selfie => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res, Employee>;
  @useResult
  $Res call(
      {@JsonKey(name: 'employee_checkin_id') String checkInId,
      @JsonKey(name: 'employee_id') String empId,
      @JsonKey(name: 'log_type') String logType,
      @JsonKey(name: 'employee_name') String employeeName,
      @JsonKey(name: 'punch_in_time') String time,
      @JsonKey(name: 'approval_status') String status,
      @JsonKey(name: 'custom_status') String isApproved,
      @JsonKey(name: 'shift_type') String shift,
      @JsonKey(name: 'custom_location_') String? location,
      @JsonKey(name: 'custom_selfie') String? selfie});
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res, $Val extends Employee>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkInId = null,
    Object? empId = null,
    Object? logType = null,
    Object? employeeName = null,
    Object? time = null,
    Object? status = null,
    Object? isApproved = null,
    Object? shift = null,
    Object? location = freezed,
    Object? selfie = freezed,
  }) {
    return _then(_value.copyWith(
      checkInId: null == checkInId
          ? _value.checkInId
          : checkInId // ignore: cast_nullable_to_non_nullable
              as String,
      empId: null == empId
          ? _value.empId
          : empId // ignore: cast_nullable_to_non_nullable
              as String,
      logType: null == logType
          ? _value.logType
          : logType // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as String,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      selfie: freezed == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeImplCopyWith<$Res>
    implements $EmployeeCopyWith<$Res> {
  factory _$$EmployeeImplCopyWith(
          _$EmployeeImpl value, $Res Function(_$EmployeeImpl) then) =
      __$$EmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'employee_checkin_id') String checkInId,
      @JsonKey(name: 'employee_id') String empId,
      @JsonKey(name: 'log_type') String logType,
      @JsonKey(name: 'employee_name') String employeeName,
      @JsonKey(name: 'punch_in_time') String time,
      @JsonKey(name: 'approval_status') String status,
      @JsonKey(name: 'custom_status') String isApproved,
      @JsonKey(name: 'shift_type') String shift,
      @JsonKey(name: 'custom_location_') String? location,
      @JsonKey(name: 'custom_selfie') String? selfie});
}

/// @nodoc
class __$$EmployeeImplCopyWithImpl<$Res>
    extends _$EmployeeCopyWithImpl<$Res, _$EmployeeImpl>
    implements _$$EmployeeImplCopyWith<$Res> {
  __$$EmployeeImplCopyWithImpl(
      _$EmployeeImpl _value, $Res Function(_$EmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkInId = null,
    Object? empId = null,
    Object? logType = null,
    Object? employeeName = null,
    Object? time = null,
    Object? status = null,
    Object? isApproved = null,
    Object? shift = null,
    Object? location = freezed,
    Object? selfie = freezed,
  }) {
    return _then(_$EmployeeImpl(
      checkInId: null == checkInId
          ? _value.checkInId
          : checkInId // ignore: cast_nullable_to_non_nullable
              as String,
      empId: null == empId
          ? _value.empId
          : empId // ignore: cast_nullable_to_non_nullable
              as String,
      logType: null == logType
          ? _value.logType
          : logType // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as String,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      selfie: freezed == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeImpl implements _Employee {
  const _$EmployeeImpl(
      {@JsonKey(name: 'employee_checkin_id') required this.checkInId,
      @JsonKey(name: 'employee_id') required this.empId,
      @JsonKey(name: 'log_type') required this.logType,
      @JsonKey(name: 'employee_name') required this.employeeName,
      @JsonKey(name: 'punch_in_time') required this.time,
      @JsonKey(name: 'approval_status') required this.status,
      @JsonKey(name: 'custom_status') required this.isApproved,
      @JsonKey(name: 'shift_type') required this.shift,
      @JsonKey(name: 'custom_location_') this.location,
      @JsonKey(name: 'custom_selfie') this.selfie});

  factory _$EmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeImplFromJson(json);

  @override
  @JsonKey(name: 'employee_checkin_id')
  final String checkInId;
  @override
  @JsonKey(name: 'employee_id')
  final String empId;
  @override
  @JsonKey(name: 'log_type')
  final String logType;
  @override
  @JsonKey(name: 'employee_name')
  final String employeeName;
  @override
  @JsonKey(name: 'punch_in_time')
  final String time;
  @override
  @JsonKey(name: 'approval_status')
  final String status;
  @override
  @JsonKey(name: 'custom_status')
  final String isApproved;
  @override
  @JsonKey(name: 'shift_type')
  final String shift;
  @override
  @JsonKey(name: 'custom_location_')
  final String? location;
  @override
  @JsonKey(name: 'custom_selfie')
  final String? selfie;

  @override
  String toString() {
    return 'Employee(checkInId: $checkInId, empId: $empId, logType: $logType, employeeName: $employeeName, time: $time, status: $status, isApproved: $isApproved, shift: $shift, location: $location, selfie: $selfie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeImpl &&
            (identical(other.checkInId, checkInId) ||
                other.checkInId == checkInId) &&
            (identical(other.empId, empId) || other.empId == empId) &&
            (identical(other.logType, logType) || other.logType == logType) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.selfie, selfie) || other.selfie == selfie));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, checkInId, empId, logType,
      employeeName, time, status, isApproved, shift, location, selfie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
      __$$EmployeeImplCopyWithImpl<_$EmployeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeImplToJson(
      this,
    );
  }
}

abstract class _Employee implements Employee {
  const factory _Employee(
      {@JsonKey(name: 'employee_checkin_id') required final String checkInId,
      @JsonKey(name: 'employee_id') required final String empId,
      @JsonKey(name: 'log_type') required final String logType,
      @JsonKey(name: 'employee_name') required final String employeeName,
      @JsonKey(name: 'punch_in_time') required final String time,
      @JsonKey(name: 'approval_status') required final String status,
      @JsonKey(name: 'custom_status') required final String isApproved,
      @JsonKey(name: 'shift_type') required final String shift,
      @JsonKey(name: 'custom_location_') final String? location,
      @JsonKey(name: 'custom_selfie') final String? selfie}) = _$EmployeeImpl;

  factory _Employee.fromJson(Map<String, dynamic> json) =
      _$EmployeeImpl.fromJson;

  @override
  @JsonKey(name: 'employee_checkin_id')
  String get checkInId;
  @override
  @JsonKey(name: 'employee_id')
  String get empId;
  @override
  @JsonKey(name: 'log_type')
  String get logType;
  @override
  @JsonKey(name: 'employee_name')
  String get employeeName;
  @override
  @JsonKey(name: 'punch_in_time')
  String get time;
  @override
  @JsonKey(name: 'approval_status')
  String get status;
  @override
  @JsonKey(name: 'custom_status')
  String get isApproved;
  @override
  @JsonKey(name: 'shift_type')
  String get shift;
  @override
  @JsonKey(name: 'custom_location_')
  String? get location;
  @override
  @JsonKey(name: 'custom_selfie')
  String? get selfie;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
