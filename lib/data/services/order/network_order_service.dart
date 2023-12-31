import 'package:hanoman/data/models/order/order.dart';
import 'package:hanoman/data/services/order/dummy_order.dart';

class NetworkOrderService {
  Future<OrderDetail> getOrderDetail({required String orderId}) async {
    return DummyOrder.getOrderDetail(orderId: orderId);
  }
}
