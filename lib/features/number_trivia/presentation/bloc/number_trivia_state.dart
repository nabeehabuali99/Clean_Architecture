import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domian/entities/number_trivia.dart';

@immutable
abstract class NumberTriviaState extends Equatable {

}

class Empty extends NumberTriviaState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loading extends NumberTriviaState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class Loaded extends NumberTriviaState {
    final NumberTrivia trivia;
    Loaded({required this.trivia });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class Error extends NumberTriviaState {
  final String message;
  Error({required this.message });
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}