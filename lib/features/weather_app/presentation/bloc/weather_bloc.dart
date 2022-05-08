import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/weather_entities.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      final weather = await fetchWeatherFromFakeApi(event.cityName);
      yield Weatherloaded(weather);
    }
  }
}

Future<Weather> fetchWeatherFromFakeApi(String cityName) {
  return Future.delayed(const Duration(seconds: 1), () {
    return Weather(
        cityName: cityName,
        temperature: ((20 + Random().nextInt(15)) + Random().nextDouble()));
  });
}
