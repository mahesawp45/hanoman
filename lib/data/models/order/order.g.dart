// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDetailImpl _$$OrderDetailImplFromJson(Map<String, dynamic> json) =>
    _$OrderDetailImpl(
      id: json['id'] as String,
      guestName: json['guestName'] as String,
      room: json['room'] as String,
      table: json['table'] as String,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderDetailImplToJson(_$OrderDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guestName': instance.guestName,
      'room': instance.room,
      'table': instance.table,
      'items': instance.items,
    };

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'price': instance.price,
    };
