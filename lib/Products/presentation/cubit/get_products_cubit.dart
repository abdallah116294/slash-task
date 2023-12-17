import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/Products/domain/entity/dummy_producst_data_entity.dart';
import 'package:slash_task/Products/domain/usecase/get_products_usecase.dart';
import 'package:slash_task/core/error/failures.dart';
import 'package:slash_task/core/usecase/usecase.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit({required this.getProductsUsecse})
      : super(GetProductsInitial());
  GetProductsUsecse getProductsUsecse;
  Future<void> getProducts() async {
    emit(GetProductsLoadingState());
    try {
      Either<Failure, DummyProductsDataEntity> response =
          await getProductsUsecse.call(NoParmas());
      emit(response.fold(
          (l) => GetProductsErrorState(error: _mapFailureToMsg(l)),
          (r) => GetProducstLoadedState(productsDataEntity: r)));
    } catch (error) {
      emit(GetProductsErrorState(error: error.toString()));
    }
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "ServerFailure";
      case CacheFailure:
        return "CacheFailure";

      default:
        return "unexpectedError";
    }
  }
}
