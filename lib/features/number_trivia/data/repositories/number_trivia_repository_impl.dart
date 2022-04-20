import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/core/platform/Network_info.dart';
import 'package:clean_architecture/features/number_trivia/domian/entities/number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/domian/repositories/number_trivia_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../datasources/number_trivia_local_data_source.dart';
import '../datasources/number_trivia_remote_data_source.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    // if(await networkInfo.isConnected){
    // final remoteTrivia = await  remoteDataSource.getConcreteNumberTrivia(number);
    //      localDataSource.cacheNumberTrivia(remoteTrivia);
    throw UnimplementedError();
  }
}
