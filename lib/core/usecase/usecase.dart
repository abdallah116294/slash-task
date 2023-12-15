import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:slash_task/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
class NoParmas extends Equatable{
  @override
  List<Object?> get props => [];

}