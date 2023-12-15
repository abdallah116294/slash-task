import 'package:slash_task/Products/data/model/products_model.dart';
import 'package:slash_task/Products/domain/entity/producst_data_entity.dart';

class ProductsDataModel extends ProductsDataEntity {
  ProductsDataModel(
      {required super.produts,
      required super.total,
      required super.skip,
      required super.limit});
  factory ProductsDataModel.fromJson(Map<String, dynamic> json) {
    return ProductsDataModel(
        produts: json['products']!=null?(json["products"] as List<dynamic>).map((e) =>ProductsModel.formJson(e) ).toList():null,
        total: json['total'],
        skip: json['skip'],
        limit: json['limit']);
  }
}
