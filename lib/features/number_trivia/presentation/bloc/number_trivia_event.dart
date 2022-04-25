import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent(List<String> list);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString) : super([numberString]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {
  const GetTriviaForRandomNumber(List<String> list) : super(list);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
