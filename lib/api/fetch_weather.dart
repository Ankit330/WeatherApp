import 'dart:convert';
import 'package:weather/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/weather_data_current/weather_data_current.dart';
import 'package:weather/model/weather_data_current/weather_data_daily.dart';
import 'package:weather/model/weather_data_current/weather_data_hourly.dart';

import '../utils/api_url.dart';

class FetchWeatherApi {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var responce = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(responce.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));
    return weatherData!;
  }
}
