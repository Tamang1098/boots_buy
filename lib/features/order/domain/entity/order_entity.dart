import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String userId;
  final List<OrderedProductEntity> products;
  final double total;


  const OrderEntity({
    required this.userId,
    required this.products,
    required this.total,
  
  });

  @override
  List<Object?> get props => [userId, products, total];
}

class OrderedProductEntity extends Equatable {
  final String id;
  final String? name;
  final int quantity;
  final double price;
  final List<AddonEntity> addons;

  const OrderedProductEntity({
    required this.id,
    this.name,
    required this.quantity,
    required this.price,
    required this.addons,
  });

  @override
  List<Object?> get props => [id, quantity, price, addons];
}

class AddonEntity extends Equatable {
  final String addonId;
  final double price;
  final int quantity;

  const AddonEntity({
    required this.addonId,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object?> get props => [addonId, price, quantity];
}
