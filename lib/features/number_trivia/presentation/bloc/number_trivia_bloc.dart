import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/core/util/input_converter.dart';
import 'package:clean_architecture/features/number_trivia/domian/usecases/get_concrete_number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/domian/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domian/entities/number_trivia.dart';
import 'number_trivia_event.dart';
import 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc(
      {required this.getConcreteNumberTrivia,
      required this.getRandomNumberTrivia,
      required this.inputConverter})
      : super(Empty());

  // NumberTriviaState get initialState => Empty();

  @override
  Stream<NumberTriviaState> mapEventToState(NumberTriviaEvent event) async* {
    if (event is GetTriviaForConcreteNumber) {
      final inputEither =
          inputConverter.stringToUnsignedInteger(event.numberString);
      yield* inputEither.fold((failure) async* {
        yield Error(message: "Invalid Input");
      }, (integer) async* {
        yield Loading();
        final failureOrTrivia = await getConcreteNumberTrivia(
            ParamsForGetConcreteNumberTrivia(number: integer));
        yield* eitherLoadedOrErrorState(failureOrTrivia);
      });
    } else if (event is GetTriviaForRandomNumber) {
      yield Loading();
      //print("nabeeh breakpoint *********");
      final failureOrTrivia = await getRandomNumberTrivia(NoParams());
      //print("nabeeh breakpoint *********22222");
      yield* eitherLoadedOrErrorState(failureOrTrivia);
    }
  }

  Stream<NumberTriviaState> eitherLoadedOrErrorState(
      Either<Failure, NumberTrivia> failureOrTrivia) async* {
    //print("nabeeh breakpoint *********33333");
    yield failureOrTrivia.fold(
        (failure) => Error(message: mapFailureToMessage(failure)),
        (trivia) => Loaded(trivia: trivia));
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure Message";
      case CacheFailure:
        return "Cache Failure Message ";
      default:
        return "Unexpected errors";
    }
  }
}
