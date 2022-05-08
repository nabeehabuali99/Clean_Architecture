import 'package:clean_architecture/features/number_trivia/presentation/bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/features/number_trivia/presentation/Widgets/widgets.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Number Trivia')),
      body: buildBlocProvider(context),
    );
  }

  Widget buildBlocProvider(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
              if (state is Empty) {
                return const MessageDisplay(
                  message: 'start searching',
                );
              } else if (state is Loading) {
                return const LoadingWidget();
              } else if (state is Loaded) {
                //  print("NAbeeh abu ali samiii");
                return TriviaDisplay(numberTrivia: state.trivia);
              } else if (state is Error) {
                return MessageDisplay(
                  message: state.message,
                );
              }
              return const MessageDisplay(
                message: 'start search hing',
              );
            }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const TriviaControl()
          ],
        ),
      ),
    );
  }
}
