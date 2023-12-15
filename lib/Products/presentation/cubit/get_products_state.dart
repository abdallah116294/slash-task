part of 'get_products_cubit.dart';

sealed class GetProductsState extends Equatable {
  const GetProductsState();

  @override
  List<Object> get props => [];
}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoadingState extends GetProductsState {}

final class GetProducstLoadedState extends GetProductsState {
  ProductsDataEntity productsDataEntity;
  GetProducstLoadedState({required this.productsDataEntity});
}

final class GetProductsErrorState extends GetProductsState {
  final String error;
 const  GetProductsErrorState({required this.error});
}
