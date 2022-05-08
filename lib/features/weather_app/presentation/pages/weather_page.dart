import 'package:clean_architecture/features/weather_app/presentation/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/buildColumnWithData.dart';
import '../widgets/buildInitialInput.dart';
import '../widgets/buildLoading.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fake Weather App"),
      ),
      body: BlocProvider(
        create: (context) => WeatherBloc(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitial) {
                return buildInitialInput();
              } else if (state is WeatherLoading) {
                return buildLoading();
              } else if (state is Weatherloaded) {
                return buildColumnWithData(state.weather);
              } else {
                return buildInitialInput();
              }
            },
          ),
        ),
      ),
    );
  }

//@override
// void dispose() {
//   // TODO: implement dispose
//   super.dispose();
//   weatherBloc.dispose();
// }

}
