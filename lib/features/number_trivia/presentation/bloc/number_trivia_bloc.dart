import 'package:flutter_bloc/flutter_bloc.dart';

import 'number_trivia_event.dart';
import 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent,NumberTriviaState>
{
  NumberTriviaBloc(NumberTriviaState initialState) : super(initialState);

 NumberTriviaState get initialState => Empty();
  Stream<NumberTriviaState> mapEventToState(
      NumberTriviaEvent event ,
      )async* {
    //TODO :Add Logic};
  }
}