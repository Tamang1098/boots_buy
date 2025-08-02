import 'package:boots_buy/features/order/domain/entity/order_entity.dart';
import 'package:boots_buy/features/order/domain/repository/order_repository.dart';

class CreateOrderUseCase {
  final OrderRepository repository;

  CreateOrderUseCase(this.repository);

  Future<void> call(OrderEntity order) async {
   print('[UseCase] Calling repository.createOrder...');
    return repository.createOrder(order);
  }
}
