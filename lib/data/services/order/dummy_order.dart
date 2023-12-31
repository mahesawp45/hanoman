import 'package:hanoman/data/models/order/order.dart';

class DummyOrder {
  static OrderDetail getOrderDetail({required String orderId}) {
    return OrderDetail(
      id: orderId,
      guestName: "Guest User $orderId",
      room: "Lantai $orderId",
      table: orderId,
      items: List.generate(
        10,
        (index) => OrderItem(
          id: "$index",
          name: "people $index",
          category: "Food",
          price: 1000 * (index + 1),
        ),
      ),
    );
  }
}
