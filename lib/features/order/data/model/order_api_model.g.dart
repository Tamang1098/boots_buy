part of 'order_api_model.dart';


OrderApiModel _$OrderApiModelFromJson(Map<String, dynamic> json) =>
    OrderApiModel(
      userId: json['userId'] as String,
      products: (json['products'] as List<dynamic>)
          .map(
              (e) => OrderedProductApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
     
    );

Map<String, dynamic> _$OrderApiModelToJson(OrderApiModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'total': instance.total,
    
    };
