import 'package:dartz/dartz.dart';
import 'package:boots_buy/core/error/failure.dart';
import 'package:boots_buy/features/order/domain/entity/order_entity.dart';
import 'package:boots_buy/features/order/domain/repository/order_repository.dart';

class GetUserOrdersUseCase {
  final OrderRepository repository;

  GetUserOrdersUseCase(this.repository);

  Future<Either<Failure, List<OrderEntity>>> call(String userId) async {
    return await repository.getUserOrders(userId);
  }
}