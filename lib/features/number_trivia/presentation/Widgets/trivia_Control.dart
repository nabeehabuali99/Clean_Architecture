
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_trivia_bloc.dart';
import '../bloc/number_trivia_event.dart';

class TriviaControl extends StatefulWidget {
  const TriviaControl({Key? key}) : super(key: key);


  @override
  State<TriviaControl> createState() => _TriviaControlState();
}

class _TriviaControlState extends State<TriviaControl> {
  late String inputStr;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'Input a number'),
          onChanged: (value) {
            inputStr = value;
          }, onSubmitted: (_){
          controller.clear();
          dispatchConcrete();
        },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Row(
          children: [
            Expanded(
                child: RaisedButton(
                    onPressed:() => dispatchConcrete(),
                    child: const Text('search'),
                    color: Theme.of(context).accentColor,
                    textTheme: ButtonTextTheme.primary)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: RaisedButton(
                onPressed: () => dispatchRandom(),
                child: const Text('Get random trivia'),
              ),
            )
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaForConcreteNumber(inputStr));
  }
  void dispatchRandom() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaForRandomNumber());
  }
}