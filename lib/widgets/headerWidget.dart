// ignore_for_file: avoid_unnecessary_containers, file_names, unused_local_variable, avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String state = "";
  String _place = "";
  String country = "";

  String date = DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placeMark[0];

    setState(() {
      city = place.locality!;
      state = place.administrativeArea!;
      _place = place.subAdministrativeArea!;
      country = place.country!;
    });
    print(place);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 100),
              alignment: Alignment.topLeft,
              child: Text(
                city != '' ? city : _place,
                style: const TextStyle(
                    fontSize: 25, height: 2.5, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              alignment: Alignment.topLeft,
              child: Text(
                city == ''
                    ? state + ' , ' + country
                    : _place == ''
                        ? state + ' , ' + country
                        : state == ''
                            ? _place + ' , ' + country
                            : country == ''
                                ? _place + " , " + state
                                : _place + " , " + state + ' , ' + country,
                style: TextStyle(
                    fontSize: 15, color: Colors.grey[700], height: 1.5),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
                height: 1.5,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
