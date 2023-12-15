// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:slash_task/models/product_propert_value.dart';
import 'package:slash_task/models/product_variation_model.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final int brandId;
  final String brandName;
  final String brainlogoUrl;
  final double rating;
  final List<ProductVariation> variation;
  final List<ProductPropertyAndValue> availableProperties;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brandId,
    required this.brandName,
    required this.brainlogoUrl,
    required this.rating,
    required this.variation,
    required this.availableProperties,
  });
 
}
