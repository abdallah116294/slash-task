import 'package:dartz/dartz.dart';
import 'package:slash_task/Products/domain/entity/dummy_producst_data_entity.dart';
import 'package:slash_task/core/error/failures.dart';

abstract class GetProductsRepository {
  Future<Either<Failure, DummyProductsDataEntity>> getProducts();
}
