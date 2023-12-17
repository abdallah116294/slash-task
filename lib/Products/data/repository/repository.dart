import 'package:dartz/dartz.dart';
import 'package:slash_task/Products/data/datasource/remoted_data_source.dart';
import 'package:slash_task/Products/domain/entity/dummy_producst_data_entity.dart';
import 'package:slash_task/Products/domain/repository/get_products_repository.dart';
import 'package:slash_task/core/error/failures.dart';

class GetProductsRepositoryImpl implements GetProductsRepository {
  RemoteDataSourc remoteDataSourc;
  GetProductsRepositoryImpl({required this.remoteDataSourc});
  @override
  Future<Either<Failure, DummyProductsDataEntity>> getProducts() async {
    try {
      var response = await remoteDataSourc.getProduct();
      return Right(response);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
