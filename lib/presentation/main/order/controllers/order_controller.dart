import 'package:hanoman/core/helper/data_state/data_state.dart';
import 'package:hanoman/data/models/order/order.dart';
import 'package:hanoman/data/repositories/order/order_repository_implementor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_controller.g.dart';

@riverpod
class OrderController extends _$OrderController {
  @override
  Future build() async {
    return null;
  }

  Future<DataState<OrderDetail>> orderDetail({required String orderId}) async {
    final response = await ref
        .read(orderRepositoryProvider)
        .getOrderDetail(orderId: orderId);

    return response.fold(
      (l) => DataState(data: null, error: l, isLoading: false),
      (r) => DataState<OrderDetail>(data: r, error: null, isLoading: false),
    );
  }
}
