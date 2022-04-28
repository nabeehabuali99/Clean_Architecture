import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/features/number_trivia/domian/entities/number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/domian/repositories/number_trivia_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';

class GetConcreteNumberTrivia
    implements UseCase<NumberTrivia, ParamsForGetConcreteNumberTrivia> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure,NumberTrivia>> call(
      ParamsForGetConcreteNumberTrivia paramsForGetConcreteNumberTrivia) async {
    // TODO: implement call
    return await repository
        .getConcreteNumberTrivia(paramsForGetConcreteNumberTrivia.number);
  }
}

class ParamsForGetConcreteNumberTrivia extends Equatable {
  final int number;

  const ParamsForGetConcreteNumberTrivia({required this.number});

  @override
  // TODO: implement props
  List<Object?> get props => [number];
}
