import 'package:equatable/equatable.dart';

class ProductsEntity extends Equatable {
    int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;
  ProductsEntity({
   required this.id,
  required  this.title,
 required   this.description,
 required   this.price,
  required  this.discountPercentage,
  required  this.rating,
required    this.stock,
required    this.brand,
required    this.category,
 required   this.thumbnail,
 required   this.images,
  });

  @override
  List<Object?> get props =>[
    id,
    title,
    description,
    price,
    discountPercentage,
    rating,
    stock,
    brand,
    category,
    thumbnail,
    images
    
  ];

}
