import 'package:boots_buy/features/brand/data/model/brand_api_model.dart';
import 'package:equatable/equatable.dart';
import 'package:boots_buy/features/product/domain/entity/add_on_entity.dart';

class ProductEntity extends Equatable {
  final String? productId;
  final String name;
  final String? description;
  final String? imageUrl;
  final double price;
  final BrandApiModel? brand;
  final String? sellerId; // add sellerId
  final List<AddonEntity>? addons; // add addons

  const ProductEntity({
    this.productId,
    required this.name,
    this.description,
    this.imageUrl,
    required this.price,
    this.brand,
    this.addons,
  });

  @override
  List<Object?> get props => [
    productId,
    name,
    description,
    imageUrl,
    price,
    brand,
    addons,
  ];
}
