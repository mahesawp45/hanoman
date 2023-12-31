import 'package:go_router/go_router.dart';
import 'package:hanoman/presentation/main/dine_in/views/dine_in_screen.dart';
import 'package:hanoman/presentation/main/order/views/order_screen.dart';
import 'package:hanoman/presentation/main/home/views/home_screen.dart';

abstract class Routes {
  static String home = "home";
  static String dineIn = "dine-in";
  static String order = "order";
}

abstract class AppRouter {
  static GoRouter routes = GoRouter(routes: [
    GoRoute(
      name: Routes.home,
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: Routes.dineIn,
      path: "/${Routes.dineIn}",
      builder: (context, state) => const DineInScreen(),
    ),
    GoRoute(
      name: Routes.order,
      path: "/${Routes.order}/:id",
      builder: (context, state) =>
          OrderScreen(orderId: state.pathParameters['id'] ?? ""),
    ),
  ]);
}
