import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/features/number_trivia/domian/entities/number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/domian/repositories/number_trivia_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia,NoParams>{

  final NumberTriviaRepository repository;
  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async{
    // TODO: implement call
    return await repository.getRandomNumberTrivia();
  }
  

}
