import 'package:dartz/dartz.dart';
import 'package:slash_task/Products/data/datasource/remoted_data_source.dart';
import 'package:slash_task/Products/domain/entity/producst_data_entity.dart';
import 'package:slash_task/Products/domain/repository/get_products_repository.dart';
import 'package:slash_task/core/error/failures.dart';

class GetProductsRepositoryImpl implements GetProductsRepository {
  RemoteDataSourceImpl remoteDataSourceImpl;
  GetProductsRepositoryImpl({required this.remoteDataSourceImpl});
  @override
  Future<Either<Failure, ProductsDataEntity>> getProducts() async {
    try {
      var response = await remoteDataSourceImpl.getProduct();
      return Right(response);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
