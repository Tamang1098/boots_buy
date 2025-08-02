import 'package:dartz/dartz.dart';
import 'package:boots_buy/core/error/failure.dart';
import '../entity/product_entity.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<ProductEntity>>> fetchProducts({
    int limit = 10,
    int page = 1,
    String? search,
  });
}
