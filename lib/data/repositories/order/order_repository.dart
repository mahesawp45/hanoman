import 'package:dartz/dartz.dart';
import 'package:hanoman/data/models/order/order.dart';

abstract class OrderRepository {
  Future<Either<String, OrderDetail>> getOrderDetail({required String orderId});
}
