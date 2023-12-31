import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state.freezed.dart';

@freezed
class DataState<T> with _$DataState {
  factory DataState({
    @Default(null) T? data,
    @Default(true) bool isLoading,
    @Default(null) String? error,
  }) = _DataState;
}
