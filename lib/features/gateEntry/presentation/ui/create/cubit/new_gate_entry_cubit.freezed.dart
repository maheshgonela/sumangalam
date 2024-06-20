// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_gate_entry_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewGateEntryState {
  GateEntryForm get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  ActionType get type => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewGateEntryStateCopyWith<NewGateEntryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewGateEntryStateCopyWith<$Res> {
  factory $NewGateEntryStateCopyWith(
          NewGateEntryState value, $Res Function(NewGateEntryState) then) =
      _$NewGateEntryStateCopyWithImpl<$Res, NewGateEntryState>;
  @useResult
  $Res call(
      {GateEntryForm form,
      bool isLoading,
      bool isSuccess,
      ActionType type,
      String? successMsg,
      Failure? error});

  $GateEntryFormCopyWith<$Res> get form;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$NewGateEntryStateCopyWithImpl<$Res, $Val extends NewGateEntryState>
    implements $NewGateEntryStateCopyWith<$Res> {
  _$NewGateEntryStateCopyWithImpl(this._value, this._then);

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
              as GateEntryForm,
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
  $GateEntryFormCopyWith<$Res> get form {
    return $GateEntryFormCopyWith<$Res>(_value.form, (value) {
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
abstract class _$$NewGateEntryStateImplCopyWith<$Res>
    implements $NewGateEntryStateCopyWith<$Res> {
  factory _$$NewGateEntryStateImplCopyWith(_$NewGateEntryStateImpl value,
          $Res Function(_$NewGateEntryStateImpl) then) =
      __$$NewGateEntryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GateEntryForm form,
      bool isLoading,
      bool isSuccess,
      ActionType type,
      String? successMsg,
      Failure? error});

  @override
  $GateEntryFormCopyWith<$Res> get form;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$NewGateEntryStateImplCopyWithImpl<$Res>
    extends _$NewGateEntryStateCopyWithImpl<$Res, _$NewGateEntryStateImpl>
    implements _$$NewGateEntryStateImplCopyWith<$Res> {
  __$$NewGateEntryStateImplCopyWithImpl(_$NewGateEntryStateImpl _value,
      $Res Function(_$NewGateEntryStateImpl) _then)
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
    return _then(_$NewGateEntryStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as GateEntryForm,
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

class _$NewGateEntryStateImpl implements _NewGateEntryState {
  const _$NewGateEntryStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isSuccess,
      required this.type,
      this.successMsg,
      this.error});

  @override
  final GateEntryForm form;
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
    return 'NewGateEntryState(form: $form, isLoading: $isLoading, isSuccess: $isSuccess, type: $type, successMsg: $successMsg, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewGateEntryStateImpl &&
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
  _$$NewGateEntryStateImplCopyWith<_$NewGateEntryStateImpl> get copyWith =>
      __$$NewGateEntryStateImplCopyWithImpl<_$NewGateEntryStateImpl>(
          this, _$identity);
}

abstract class _NewGateEntryState implements NewGateEntryState {
  const factory _NewGateEntryState(
      {required final GateEntryForm form,
      required final bool isLoading,
      required final bool isSuccess,
      required final ActionType type,
      final String? successMsg,
      final Failure? error}) = _$NewGateEntryStateImpl;

  @override
  GateEntryForm get form;
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
  _$$NewGateEntryStateImplCopyWith<_$NewGateEntryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
