import 'package:slash_task/Products/data/model/products_model.dart';
import 'package:slash_task/Products/domain/entity/dummy_producst_data_entity.dart';

class DummyProductsDataModel extends DummyProductsDataEntity {
  DummyProductsDataModel(
      {required super.produts, required super.total, required super.skip, required super.limit,
});
  factory DummyProductsDataModel.fromJson(Map<String, dynamic> json) {
    List<ProductsModel> productsList = (json["products"] as List).map((e) => ProductsModel.formJson(e)).toList();
    return DummyProductsDataModel(
        produts: productsList,
        limit: json["limit"],
        skip: json['skip'],
        total: json['skip']
       );
  }
}
