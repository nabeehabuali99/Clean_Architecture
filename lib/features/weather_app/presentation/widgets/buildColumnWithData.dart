import 'package:flutter/material.dart';

 import '../../domain/entities/weather_entities.dart';
import 'CityInputField.dart';

Column buildColumnWithData(Weather weather) {
  return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Text(
      weather.cityName,
      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
    ),
    Text('${weather.temperature.toStringAsFixed(1)} C ',
        style: const TextStyle(fontSize: 80)),
    const CityInputField(),
  ]);
}
