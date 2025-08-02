part of 'brand_api_model.dart';


BrandApiModel _$BrandApiModelFromJson(Map<String, dynamic> json) =>
    BrandApiModel(
      brandId: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BrandApiModelToJson(BrandApiModel instance) =>
    <String, dynamic>{
      '_id': instance.brandId,
      'name': instance.name,
    };