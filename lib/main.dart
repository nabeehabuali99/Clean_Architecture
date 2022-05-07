import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<NumberTriviaBloc>(),
      child: MaterialApp(

debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
            primaryColor: Colors.green.shade800,
            accentColor: Colors.green.shade600),
        home: const NumberTriviaPage(),
      ),
    );
  }
}
