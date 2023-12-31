// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataState<T> {
  T? get data => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataStateCopyWith<T, DataState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStateCopyWith<T, $Res> {
  factory $DataStateCopyWith(
          DataState<T> value, $Res Function(DataState<T>) then) =
      _$DataStateCopyWithImpl<T, $Res, DataState<T>>;
  @useResult
  $Res call({T? data, bool isLoading, String? error});
}

/// @nodoc
class _$DataStateCopyWithImpl<T, $Res, $Val extends DataState<T>>
    implements $DataStateCopyWith<T, $Res> {
  _$DataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataStateImplCopyWith<T, $Res>
    implements $DataStateCopyWith<T, $Res> {
  factory _$$DataStateImplCopyWith(
          _$DataStateImpl<T> value, $Res Function(_$DataStateImpl<T>) then) =
      __$$DataStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data, bool isLoading, String? error});
}

/// @nodoc
class __$$DataStateImplCopyWithImpl<T, $Res>
    extends _$DataStateCopyWithImpl<T, $Res, _$DataStateImpl<T>>
    implements _$$DataStateImplCopyWith<T, $Res> {
  __$$DataStateImplCopyWithImpl(
      _$DataStateImpl<T> _value, $Res Function(_$DataStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$DataStateImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DataStateImpl<T> implements _DataState<T> {
  _$DataStateImpl({this.data = null, this.isLoading = true, this.error = null});

  @override
  @JsonKey()
  final T? data;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? error;

  @override
  String toString() {
    return 'DataState<$T>(data: $data, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataStateImplCopyWith<T, _$DataStateImpl<T>> get copyWith =>
      __$$DataStateImplCopyWithImpl<T, _$DataStateImpl<T>>(this, _$identity);
}

abstract class _DataState<T> implements DataState<T> {
  factory _DataState(
      {final T? data,
      final bool isLoading,
      final String? error}) = _$DataStateImpl<T>;

  @override
  T? get data;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$DataStateImplCopyWith<T, _$DataStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
