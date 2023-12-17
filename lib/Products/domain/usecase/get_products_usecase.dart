import 'package:dartz/dartz.dart';
import 'package:slash_task/Products/domain/entity/dummy_producst_data_entity.dart';
import 'package:slash_task/Products/domain/repository/get_products_repository.dart';
import 'package:slash_task/core/error/failures.dart';
import 'package:slash_task/core/usecase/usecase.dart';

class GetProductsUsecse implements UseCase<DummyProductsDataEntity, NoParmas> {
  GetProductsRepository getProductsRepository;
  GetProductsUsecse({required this.getProductsRepository});
  @override
  Future<Either<Failure, DummyProductsDataEntity>> call(NoParmas parmas) =>
      getProductsRepository.getProducts();
}
