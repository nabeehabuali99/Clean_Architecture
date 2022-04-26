import 'package:clean_architecture/core/util/input_converter.dart';
import 'package:clean_architecture/features/number_trivia/domian/usecases/get_concrete_number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/domian/usecases/get_random_number_trivia.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'number_trivia_event.dart';
import 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

   NumberTriviaBloc(this.getConcreteNumberTrivia, this.getRandomNumberTrivia,
      {required NumberTriviaState initialState,
      required GetConcreteNumberTrivia concrete,
      required GetRandomNumberTrivia random,
      required this.inputConverter})
      :super(initialState);

  NumberTriviaState get initialState => Empty();

  Stream<NumberTriviaState> mapEventToState(NumberTriviaEvent event) async* {
     if(event is GetTriviaForConcreteNumber){
      final inputEither= inputConverter.stringToUnsignedInteger(event.numberString);
     yield* inputEither.fold((failure) async* {
       yield Error(message: "Invalid Input");
     }, (integer) => throw UnimplementedError());

     }
  }
}
