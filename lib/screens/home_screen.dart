// ignore_for_file: camel_case_types, unused_import, depend_on_referenced_packages, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:weather/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weather/utils/customs_color.dart';
import 'package:weather/widgets/comfort_level.dart';
import 'package:weather/widgets/currentWeatherWidget.dart';
import 'package:weather/widgets/headerWidget.dart';
import '../widgets/Daily_Data_widget.dart';
import '../widgets/hourly_data_widget.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => globalController.checkLoading().isTrue
            ? Center(
                child: Image.asset(
                  'assets/icons/clouds.png',
                  height: 200,
                  width: 200,
                ),
              )
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(height: 20),
                    const HeaderWidget(),
                    CurrentWeatherWidget(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather()),
                    HourlyDataWidget(
                      weatherDataHourly:
                          globalController.getData().getHourlyWeather(),
                    ),
                    DailyDataForecast(
                      weatherDataDaily:
                          globalController.getData().getdailyWeather(),
                    ),
                    Container(
                      height: 1,
                      color: CustomColor.dividerLine,
                    ),
                    const SizedBox(height: 10),
                    comfortLevelWidget(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather()),
                  ],
                ),
              ),
      ),
    ));
  }
}
