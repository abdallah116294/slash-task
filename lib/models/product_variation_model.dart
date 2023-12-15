import 'package:slash_task/models/product_propert_value.dart';

class ProductVariation {
  final int id;
  final int prodcutId;
  final num price;
  final int quantity;
  final bool isStock;
  final List<String> productVarientImages;
  final List<ProductPropertyAndValue> productPropertyAndValue;
  ProductVariation({
    required this.id,
    required this.prodcutId,
    required this.price,
    required this.quantity,
    required this.isStock,
    required this.productVarientImages,
    required this.productPropertyAndValue,
  });
}
