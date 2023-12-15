import 'package:equatable/equatable.dart';
import 'package:slash_task/Products/domain/entity/prodcts_entity.dart';

class ProductsDataEntity extends Equatable {
  List<ProductsEntity>? produts;
  int? total;
  int? skip;
  int? limit;
  ProductsDataEntity({
    required this.produts,
    required this.total,
    required this.skip,
    required this.limit,
  });
  
  @override
  
  List<Object?> get props => [
    produts,
    total,
    skip,
    limit
  ];

}
