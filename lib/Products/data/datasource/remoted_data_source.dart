import 'package:slash_task/Products/data/model/producst_data_model.dart';
import 'package:slash_task/core/api/api_endpoints.dart';
import 'package:slash_task/core/api/dio_consumer.dart';

abstract class RemoteDataSourc {
  Future<ProductsDataModel> getProduct();
}

class RemoteDataSourceImpl implements RemoteDataSourc {
  DioConsumer dioConsumer;
  RemoteDataSourceImpl({required this.dioConsumer});
  @override
  Future<ProductsDataModel> getProduct() async {
    var response =await dioConsumer.get(APIEndPoints.productsEndPoint);
    return ProductsDataModel.fromJson(response);
  }
}
