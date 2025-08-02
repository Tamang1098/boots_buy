
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:servzz/features/brand/domain/entity/brand_entity.dart'; // import entity

part 'brand_api_model.g.dart';

@JsonSerializable()
class BrandApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? brandId;

  final String? name;

  const BrandApiModel({this.brandId, this.name});

  factory BrandApiModel.fromJson(Map<String, dynamic> json) =>
      _$BrandyApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandApiModelToJson(this);

  // Add this method:
  BrandEntity toEntity() {
    return BrandEntity(brandId: brandId, name: name);
  }

  @override
  List<Object?> get props => [brandId, name];
}
