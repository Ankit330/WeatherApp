// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather/utils/customs_color.dart';

import '../model/weather_data_current/weather_data_current.dart';

class comfortLevelWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const comfortLevelWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 1, left: 20, right: 20),
          child: const Text(
            "Comfort Level",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                      animationEnabled: true,
                      size: 140,
                      customColors: CustomSliderColors(
                          hideShadow: true,
                          trackColor:
                              CustomColor.firstGradientColor.withAlpha(100),
                          progressBarColors: [
                            CustomColor.firstGradientColor,
                            CustomColor.secondGradientColor
                          ]),
                      customWidths: CustomSliderWidths(
                          handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                      infoProperties: InfoProperties(
                          bottomLabelText: "Humidity",
                          bottomLabelStyle: const TextStyle(
                              letterSpacing: 0.1, fontSize: 17, height: 1.5))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Feels Likes ",
                        style: TextStyle(
                            fontSize: 15,
                            height: 0.8,
                            color: CustomColor.textColorBlack,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: "${weatherDataCurrent.current.feelsLike}",
                        style: const TextStyle(
                            fontSize: 15,
                            height: 0.8,
                            color: CustomColor.textColorBlack,
                            fontWeight: FontWeight.w500)),
                  ])),
                  Container(
                    height: 25,
                    width: 1,
                    color: CustomColor.dividerLine,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "UV Index ",
                        style: TextStyle(
                            fontSize: 15,
                            height: 0.8,
                            color: CustomColor.textColorBlack,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: "${weatherDataCurrent.current.uvIndex}",
                        style: const TextStyle(
                            fontSize: 15,
                            height: 0.8,
                            color: CustomColor.textColorBlack,
                            fontWeight: FontWeight.w500)),
                  ])),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
