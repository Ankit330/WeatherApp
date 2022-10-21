import 'package:weather/model/weather_data_current/weather_data_current.dart';
import 'package:weather/model/weather_data_current/weather_data_hourly.dart';
import 'weather_data_current/weather_data_daily.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;
  WeatherData([this.current, this.hourly, this.daily]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataDaily getdailyWeather() => daily!;
}
