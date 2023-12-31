import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class OrderDetail with _$OrderDetail {
  factory OrderDetail({
    required String id,
    required String guestName,
    required String room,
    required String table,
    List<OrderItem>? items,
  }) = _OrderDetail;

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  factory OrderItem({
    required String id,
    required String name,
    required String category,
    required double price,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}
