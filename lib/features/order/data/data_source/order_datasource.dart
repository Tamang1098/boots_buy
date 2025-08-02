import 'package:boots_buy/features/order/data/model/order_api_model.dart';

abstract class OrderRemoteDataSource {
  Future<void> createOrder(OrderApiModel order);
  Future<List<OrderApiModel>> getUserOrders(String userId);
}
