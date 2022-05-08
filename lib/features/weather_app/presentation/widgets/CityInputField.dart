
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';

class CityInputField extends StatefulWidget {
  const CityInputField({Key? key}) : super(key: key);

  @override
  State<CityInputField> createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  late String inputStr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onChanged: (value) {
          inputStr = value;
        },
        onSubmitted: (_) {
          submitCityName();
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city ",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName() {
    BlocProvider.of<WeatherBloc>(context).add(GetWeather(inputStr));
  }
}