import 'package:slash_task/Products/domain/entity/prodcts_entity.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.price,
      required super.discountPercentage,
      required super.rating,
      required super.stock,
      required super.brand,
      required super.category,
      required super.thumbnail,
      required super.images});
  factory ProductsModel.formJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        discountPercentage: json['discountPercentage'],
        rating: json['rating'],
        stock: json['stock'],
        brand: json['brand'],
        category: json['category'],
        thumbnail: json['thumbnail'],
        images: List<String>.from(json["images"])
        );
  }
}
