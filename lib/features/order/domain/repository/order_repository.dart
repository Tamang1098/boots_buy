import 'package:dartz/dartz.dart';
import 'package:boots_buy/core/error/failure.dart';
import 'package:boots_buy/features/order/domain/entity/order_entity.dart';

abstract class OrderRepository {
  Future<void> createOrder(OrderEntity order);
 Future<Either<Failure, List<OrderEntity>>> getUserOrders(String userId);
}
