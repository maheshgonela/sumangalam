// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_on_duty_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewOnDutyState {
  OnDutyForm get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewOnDutyStateCopyWith<NewOnDutyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewOnDutyStateCopyWith<$Res> {
  factory $NewOnDutyStateCopyWith(
          NewOnDutyState value, $Res Function(NewOnDutyState) then) =
      _$NewOnDutyStateCopyWithImpl<$Res, NewOnDutyState>;
  @useResult
  $Res call(
      {OnDutyForm form, bool isLoading, bool isSuccess, Failure? failure});

  $OnDutyFormCopyWith<$Res> get form;
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$NewOnDutyStateCopyWithImpl<$Res, $Val extends NewOnDutyState>
    implements $NewOnDutyStateCopyWith<$Res> {
  _$NewOnDutyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as OnDutyForm,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OnDutyFormCopyWith<$Res> get form {
    return $OnDutyFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewOnDutyStateImplCopyWith<$Res>
    implements $NewOnDutyStateCopyWith<$Res> {
  factory _$$NewOnDutyStateImplCopyWith(_$NewOnDutyStateImpl value,
          $Res Function(_$NewOnDutyStateImpl) then) =
      __$$NewOnDutyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OnDutyForm form, bool isLoading, bool isSuccess, Failure? failure});

  @override
  $OnDutyFormCopyWith<$Res> get form;
  @override
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$NewOnDutyStateImplCopyWithImpl<$Res>
    extends _$NewOnDutyStateCopyWithImpl<$Res, _$NewOnDutyStateImpl>
    implements _$$NewOnDutyStateImplCopyWith<$Res> {
  __$$NewOnDutyStateImplCopyWithImpl(
      _$NewOnDutyStateImpl _value, $Res Function(_$NewOnDutyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? failure = freezed,
  }) {
    return _then(_$NewOnDutyStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as OnDutyForm,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$NewOnDutyStateImpl implements _NewOnDutyState {
  const _$NewOnDutyStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isSuccess,
      this.failure});

  @override
  final OnDutyForm form;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'NewOnDutyState(form: $form, isLoading: $isLoading, isSuccess: $isSuccess, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewOnDutyStateImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, form, isLoading, isSuccess, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewOnDutyStateImplCopyWith<_$NewOnDutyStateImpl> get copyWith =>
      __$$NewOnDutyStateImplCopyWithImpl<_$NewOnDutyStateImpl>(
          this, _$identity);
}

abstract class _NewOnDutyState implements NewOnDutyState {
  const factory _NewOnDutyState(
      {required final OnDutyForm form,
      required final bool isLoading,
      required final bool isSuccess,
      final Failure? failure}) = _$NewOnDutyStateImpl;

  @override
  OnDutyForm get form;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$NewOnDutyStateImplCopyWith<_$NewOnDutyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
