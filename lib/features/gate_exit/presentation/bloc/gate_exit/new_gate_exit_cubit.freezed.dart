// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_gate_exit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewGateExitState {
  GateExitForm get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  ActionType get type => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewGateExitStateCopyWith<NewGateExitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewGateExitStateCopyWith<$Res> {
  factory $NewGateExitStateCopyWith(
          NewGateExitState value, $Res Function(NewGateExitState) then) =
      _$NewGateExitStateCopyWithImpl<$Res, NewGateExitState>;
  @useResult
  $Res call(
      {GateExitForm form,
      bool isLoading,
      bool isSuccess,
      ActionType type,
      String? successMsg,
      Failure? error});

  $GateExitFormCopyWith<$Res> get form;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$NewGateExitStateCopyWithImpl<$Res, $Val extends NewGateExitState>
    implements $NewGateExitStateCopyWith<$Res> {
  _$NewGateExitStateCopyWithImpl(this._value, this._then);

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
    Object? type = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as GateExitForm,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      successMsg: freezed == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GateExitFormCopyWith<$Res> get form {
    return $GateExitFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewGateExitStateImplCopyWith<$Res>
    implements $NewGateExitStateCopyWith<$Res> {
  factory _$$NewGateExitStateImplCopyWith(_$NewGateExitStateImpl value,
          $Res Function(_$NewGateExitStateImpl) then) =
      __$$NewGateExitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GateExitForm form,
      bool isLoading,
      bool isSuccess,
      ActionType type,
      String? successMsg,
      Failure? error});

  @override
  $GateExitFormCopyWith<$Res> get form;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$NewGateExitStateImplCopyWithImpl<$Res>
    extends _$NewGateExitStateCopyWithImpl<$Res, _$NewGateExitStateImpl>
    implements _$$NewGateExitStateImplCopyWith<$Res> {
  __$$NewGateExitStateImplCopyWithImpl(_$NewGateExitStateImpl _value,
      $Res Function(_$NewGateExitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? type = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_$NewGateExitStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as GateExitForm,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      successMsg: freezed == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$NewGateExitStateImpl implements _NewGateExitState {
  const _$NewGateExitStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isSuccess,
      required this.type,
      this.successMsg,
      this.error});

  @override
  final GateExitForm form;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final ActionType type;
  @override
  final String? successMsg;
  @override
  final Failure? error;

  @override
  String toString() {
    return 'NewGateExitState(form: $form, isLoading: $isLoading, isSuccess: $isSuccess, type: $type, successMsg: $successMsg, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewGateExitStateImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, form, isLoading, isSuccess, type, successMsg, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewGateExitStateImplCopyWith<_$NewGateExitStateImpl> get copyWith =>
      __$$NewGateExitStateImplCopyWithImpl<_$NewGateExitStateImpl>(
          this, _$identity);
}

abstract class _NewGateExitState implements NewGateExitState {
  const factory _NewGateExitState(
      {required final GateExitForm form,
      required final bool isLoading,
      required final bool isSuccess,
      required final ActionType type,
      final String? successMsg,
      final Failure? error}) = _$NewGateExitStateImpl;

  @override
  GateExitForm get form;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  ActionType get type;
  @override
  String? get successMsg;
  @override
  Failure? get error;
  @override
  @JsonKey(ignore: true)
  _$$NewGateExitStateImplCopyWith<_$NewGateExitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
