// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logged_in_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoggedInUser _$LoggedInUserFromJson(Map<String, dynamic> json) {
  return _LoggedInUser.fromJson(json);
}

/// @nodoc
mixin _$LoggedInUser {
  @JsonKey(name: 'full_name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'api_key', defaultValue: '')
  String get apiKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'api_secret', defaultValue: '')
  String get apiSecret => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoggedInUserCopyWith<LoggedInUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedInUserCopyWith<$Res> {
  factory $LoggedInUserCopyWith(
          LoggedInUser value, $Res Function(LoggedInUser) then) =
      _$LoggedInUserCopyWithImpl<$Res, LoggedInUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'full_name', defaultValue: '') String name,
      @JsonKey(name: 'api_key', defaultValue: '') String apiKey,
      @JsonKey(name: 'api_secret', defaultValue: '') String apiSecret,
      @JsonKey(defaultValue: '') String password});
}

/// @nodoc
class _$LoggedInUserCopyWithImpl<$Res, $Val extends LoggedInUser>
    implements $LoggedInUserCopyWith<$Res> {
  _$LoggedInUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? apiKey = null,
    Object? apiSecret = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      apiSecret: null == apiSecret
          ? _value.apiSecret
          : apiSecret // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoggedInUserImplCopyWith<$Res>
    implements $LoggedInUserCopyWith<$Res> {
  factory _$$LoggedInUserImplCopyWith(
          _$LoggedInUserImpl value, $Res Function(_$LoggedInUserImpl) then) =
      __$$LoggedInUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'full_name', defaultValue: '') String name,
      @JsonKey(name: 'api_key', defaultValue: '') String apiKey,
      @JsonKey(name: 'api_secret', defaultValue: '') String apiSecret,
      @JsonKey(defaultValue: '') String password});
}

/// @nodoc
class __$$LoggedInUserImplCopyWithImpl<$Res>
    extends _$LoggedInUserCopyWithImpl<$Res, _$LoggedInUserImpl>
    implements _$$LoggedInUserImplCopyWith<$Res> {
  __$$LoggedInUserImplCopyWithImpl(
      _$LoggedInUserImpl _value, $Res Function(_$LoggedInUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? apiKey = null,
    Object? apiSecret = null,
    Object? password = null,
  }) {
    return _then(_$LoggedInUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      apiSecret: null == apiSecret
          ? _value.apiSecret
          : apiSecret // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoggedInUserImpl extends _LoggedInUser {
  const _$LoggedInUserImpl(
      {@JsonKey(name: 'full_name', defaultValue: '') required this.name,
      @JsonKey(name: 'api_key', defaultValue: '') required this.apiKey,
      @JsonKey(name: 'api_secret', defaultValue: '') required this.apiSecret,
      @JsonKey(defaultValue: '') required this.password})
      : super._();

  factory _$LoggedInUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoggedInUserImplFromJson(json);

  @override
  @JsonKey(name: 'full_name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'api_key', defaultValue: '')
  final String apiKey;
  @override
  @JsonKey(name: 'api_secret', defaultValue: '')
  final String apiSecret;
  @override
  @JsonKey(defaultValue: '')
  final String password;

  @override
  String toString() {
    return 'LoggedInUser(name: $name, apiKey: $apiKey, apiSecret: $apiSecret, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedInUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.apiSecret, apiSecret) ||
                other.apiSecret == apiSecret) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, apiKey, apiSecret, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedInUserImplCopyWith<_$LoggedInUserImpl> get copyWith =>
      __$$LoggedInUserImplCopyWithImpl<_$LoggedInUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoggedInUserImplToJson(
      this,
    );
  }
}

abstract class _LoggedInUser extends LoggedInUser {
  const factory _LoggedInUser(
      {@JsonKey(name: 'full_name', defaultValue: '') required final String name,
      @JsonKey(name: 'api_key', defaultValue: '') required final String apiKey,
      @JsonKey(name: 'api_secret', defaultValue: '')
      required final String apiSecret,
      @JsonKey(defaultValue: '')
      required final String password}) = _$LoggedInUserImpl;
  const _LoggedInUser._() : super._();

  factory _LoggedInUser.fromJson(Map<String, dynamic> json) =
      _$LoggedInUserImpl.fromJson;

  @override
  @JsonKey(name: 'full_name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'api_key', defaultValue: '')
  String get apiKey;
  @override
  @JsonKey(name: 'api_secret', defaultValue: '')
  String get apiSecret;
  @override
  @JsonKey(defaultValue: '')
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoggedInUserImplCopyWith<_$LoggedInUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
