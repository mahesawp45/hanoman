// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hanoman/data/models/order/order.dart';
import 'package:hanoman/data/repositories/order/order_repository.dart';
import 'package:hanoman/data/services/order/local_order_service.dart';
import 'package:hanoman/data/services/order/network_order_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_repository_implementor.g.dart';

class OrderRepositoryImplementor extends OrderRepository {
  final NetworkOrderService networkOrderService;
  final LocalOrderService localOrderService;
  Ref ref;

  OrderRepositoryImplementor({
    required this.networkOrderService,
    required this.localOrderService,
    required this.ref,
  });

  @override
  Future<Either<String, OrderDetail>> getOrderDetail(
      {required String orderId}) async {
    try {
      OrderDetail response;

      // var connectivity = ref.watch(connectivityStatusProviders);
      // if (connectivity == ConnectivityStatus.isDisconnected) {
      //   response = await localOrderService.getOrderDetail(orderId: orderId);
      // } else {
      //   response = await networkOrderService.getOrderDetail(orderId: orderId);
      // }
      response = await networkOrderService.getOrderDetail(orderId: orderId);

      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

@riverpod
OrderRepository orderRepository(OrderRepositoryRef ref) {
  final networkOrderService = NetworkOrderService();
  final localOrderService = LocalOrderService();

  return OrderRepositoryImplementor(
    networkOrderService: networkOrderService,
    localOrderService: localOrderService,
    ref: ref,
  );
}
