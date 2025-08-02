import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boots_buy/features/order/domain/entity/order_entity.dart';
import 'package:boots_buy/features/order/domain/use_case/create_order_usecase.dart';
import 'package:boots_buy/features/order/domain/use_case/get_order_usecase.dart';
import 'order_event.dart';
import 'order_state.dart';
import 'package:jwt_decode/jwt_decode.dart';

class OrderViewModel extends Bloc<OrderEvent, OrderState> {
  final CreateOrderUseCase createOrderUseCase;
  final GetUserOrdersUseCase getUserOrdersUseCase;

  OrderViewModel({
    required this.createOrderUseCase,
    required this.getUserOrdersUseCase,
  }) : super(OrderInitial()) {
    on<CreateOrderEvent>(_onCreateOrder);
    on<LoadUserOrdersEvent>(_onLoadUserOrders);
    on<RefreshUserOrdersEvent>(_onRefreshUserOrders);
  }

  Future<void> _onCreateOrder(
    CreateOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    print('[OrderBloc] OrderLoading emitted');

    try {
      final token = event.order.userId; // Currently the full JWT token
      final payload = Jwt.parseJwt(token);
      final userId = payload['_id']; // Extract the actual user ID string

      // Create a new OrderEntity with the extracted userId and other fields unchanged
      final correctedOrder = OrderEntity(
        userId: userId,
        products: event.order.products,
        total: event.order.total,
      
      );
    }
  }

  Future<void> _onRefreshUserOrders(
    RefreshUserOrdersEvent event,
    Emitter<OrderState> emit,
  ) async {
    await _fetchOrders(event.userId, emit);
  }
  


  Future<void> _fetchOrders(String userId, Emitter<OrderState> emit) async {
    print('🔁 Calling getUserOrdersUseCase for userId: $userId');
    final result = await getUserOrdersUseCase(userId);

    result.fold(
      (failure) {
        print('❌ Failed to fetch orders: ${failure.message}');
        emit(OrderFailure(failure.message));
      },
      (orders) {
        print('✅ Orders fetched: ${orders.length}');
        emit(OrderLoaded(orders));
      },
    );
  }
}
