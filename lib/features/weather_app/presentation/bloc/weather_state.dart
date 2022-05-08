part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}
class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}
class Weatherloaded extends WeatherState {
  final Weather weather;
  const Weatherloaded(this.weather);

  @override
  List<Object> get props => [weather];
}
class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object> get props => [message];
}
