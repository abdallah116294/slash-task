import 'package:slash_task/Products/data/model/dummy_producst_data_model.dart';
import 'package:slash_task/core/api/api_consumer.dart';
import 'package:slash_task/core/api/api_endpoints.dart';
import 'package:slash_task/core/api/api_get.dart';
import 'package:slash_task/core/api/dio_consumer.dart';
abstract class RemoteDataSourc {
  Future<DummyProductsDataModel> getProduct();
}

class RemoteDataSourceImpl implements RemoteDataSourc {
  // ApiConsumer apiConsumer;
  DioConsumer dioConsumer;
  DioHelper dioHelper;
  RemoteDataSourceImpl(
      {
      //required this.apiConsumer,
      required this.dioConsumer,
      required this.dioHelper});
  @override
  Future<DummyProductsDataModel> getProduct() async {
    var response = await dioConsumer.get(APIEndPoints.productsEndPoint);
    // var response = await dioHelper.getProductsData();
    return DummyProductsDataModel.fromJson(response);
  }
}

