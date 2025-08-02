import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:boots_buy/features/order/data/model/ordered_product_api_model.dart';
import 'package:boots_buy/features/order/domain/entity/order_entity.dart';


// dart run build_runner build -d
part 'order_api_model.g.dart'; 

@JsonSerializable(explicitToJson: true)
class OrderApiModel extends Equatable {
  final String userId;
  final List<OrderedProductApiModel> products;
  final double total;
 

  const OrderApiModel({
    required this.userId,
    required this.products,
    required this.total,
  });

  /// From JSON
  factory OrderApiModel.fromJson(Map<String, dynamic> json) =>
      _$OrderApiModelFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$OrderApiModelToJson(this);

  /// Convert from Entity to ApiModel
  factory OrderApiModel.fromEntity(OrderEntity entity) {
    return OrderApiModel(
      userId: entity.userId,
      products: entity.products
          .map((product) => OrderedProductApiModel.fromEntity(product))
          .toList(),
      total: entity.total,
    
    );
  }

  /// Convert ApiModel to Entity
  OrderEntity toEntity() {
    return OrderEntity(
      userId: userId,
      products: products.map((product) => product.toEntity()).toList(),
      total: total,
     
    );
  }

  @override
  List<Object?> get props => [
        userId,
        products,
        total,
       
      ];
}
