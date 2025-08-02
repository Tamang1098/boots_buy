part of 'ordered_product_api_model.dart';

OrderedProductApiModel _$OrderedProductApiModelFromJson(
        Map<String, dynamic> json) =>
    OrderedProductApiModel(
      id: json['_id'] as String,
      name: json['name'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      addons: (json['addons'] as List<dynamic>)
          .map((e) => OrderedAddonApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderedProductApiModelToJson(
        OrderedProductApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'price': instance.price,
      'addons': instance.addons.map((e) => e.toJson()).toList(),
    };
