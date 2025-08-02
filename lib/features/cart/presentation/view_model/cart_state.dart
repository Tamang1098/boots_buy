import 'package:boots_buy/features/cart/domain/model/cart_item.dart';
import 'package:equatable/equatable.dart';



class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({this.items = const []});

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + item.totalPrice);

  int get totalItems =>
      items.fold(0, (sum, item) => sum + item.quantity);

  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }

  @override
  List<Object?> get props => [items];
}
