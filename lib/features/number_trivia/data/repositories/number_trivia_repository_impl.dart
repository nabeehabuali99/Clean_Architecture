import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/core/platform/Network_info.dart';
import 'package:clean_architecture/features/number_trivia/domian/entities/number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/domian/repositories/number_trivia_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../core/error/exceptions.dart';
import '../datasources/number_trivia_local_data_source.dart';
import '../datasources/number_trivia_remote_data_source.dart';

typedef Future<NumberTrivia> ConcreteOrRandomChooser();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await getTrivia(() {
      return remoteDataSource.getRandomNumberTrivia();
    });
  }

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    return await getTrivia(() {
      return remoteDataSource.getConcreteNumberTrivia(number);
    });
  }


  Future<Either<Failure, NumberTrivia>> getTrivia(ConcreteOrRandomChooser getConcreteOrRandom) async {
    if (await networkInfo.isConnected) {
      try {
       final remoteTrivia = await getConcreteOrRandom();
       //  localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      }
      on ServerException {
        return const Left(ServerFailure(properties: ['ServerFailure']));
      }
    }
    else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return const Left(CacheFailure(properties: ['CacheFailure']));
      }
    }
  }
}

