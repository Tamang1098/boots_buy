import 'package:equatable/equatable.dart';

class BrandEntity extends Equatable {
  final String? brandId;
  final String? name;

  const BrandEntity({
    this.brandId,
    this.name,
  });

  @override
  List<Object?> get props => [
        brandId,
        name,
      ];
}