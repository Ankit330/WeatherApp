// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather_data_current/weather_data_daily.dart';
import 'package:weather/utils/customs_color.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({super.key, required this.weatherDataDaily});

  String getData(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CustomColor.dividerLine.withAlpha(150)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text("Next Days",
                style:
                    TextStyle(color: CustomColor.textColorBlack, fontSize: 18)),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 310,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weatherDataDaily.daily.length > 7
              ? 7
              : weatherDataDaily.daily.length,
          itemBuilder: (contex, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          getData(weatherDataDaily.daily[index].dt),
                          style: const TextStyle(
                              color: CustomColor.textColorBlack, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: Image.asset(
                            'assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png'),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 50,
                        child: Text(
                            '${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°'),
                      ),
                      Container(
                        height: 2,
                        color: CustomColor.dividerLine,
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
