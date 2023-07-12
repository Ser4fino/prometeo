// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class WeatherModel {
  double? longitude;
  double? latitude;
  double? temperature;
  String? weathercodeDescr;
  String? dateToday;
  int? code;
  String? cityName;
  int? isDay;
  String? img;
  WeatherModel(
      {this.latitude,
      this.longitude,
      this.temperature,
      this.weathercodeDescr,
      this.dateToday,
      this.code,
      this.cityName,
      this.isDay,
      this.img});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    temperature = json['current_weather']['temperature'];
    //weathercode = json['current_weather']['weathercode'].toString();
    //dateToday = json['current_weather']['time'];
    isDay = json['current_weather']['is_day'];
    code = json['current_weather']['weathercode'];
    String date = json['current_weather']['time'];
    DateTime tempDate = DateTime.parse(date);
    print(tempDate);
    // String formattedDate = DateFormat('E, d MMMM yyyy').format(tempDate);
    // dateToday = formattedDate;
    initializeDateFormatting('it-IT', '').then((_) {
      dateToday = DateFormat('E, d MMMM yyyy', 'it-IT').format(tempDate);
    });
    if (code == 0) {
      weathercodeDescr = 'Sereno';
      if (isDay == 1) {
        img = 'assets/weather/Sun.png';
      } else {
        img = 'assets/weather/Moon stars.png';
      }
    } else if (code == 1 || code == 2 || code == 3) {
      weathercodeDescr = 'Parzialmente nuvoloso';
      if (isDay == 1) {
        img = 'assets/weather/Sun cloud.png';
      } else {
        img = 'assets/weather/Moon cloud.png';
      }
    } else if (code == 45 || code == 48) {
      weathercodeDescr = 'Nebbia';
      if (isDay == 1) {
        img = 'assets/weather/Cloud.png';
      } else {
        img = 'assets/weather/Cloud.png';
      }
    } else if (code == 51 || code == 53 || code == 55) {
      weathercodeDescr = 'Pioggerellina';
      if (isDay == 1) {
        img = 'assets/weather/Sun cloud little rain.png';
      } else {
        img = 'assets/weather/Moon cloud little rain.png';
      }
    } else if (code == 56 || code == 57) {
      weathercodeDescr = 'Pioggerellina gelata';
      if (isDay == 1) {
        img = 'assets/weather/Sun cloud hailstone.png';
      } else {
        img = 'assets/weather/Moon cloud hailstone.png';
      }
    } else if (code == 61) {
      weathercodeDescr = 'Pioggia';
      if (isDay == 1) {
        img = 'assets/weather/Sun cloud little rain.png';
      } else {
        img = 'assets/weather/Moon cloud little rain.png';
      }
    } else if (code == 63) {
      weathercodeDescr = 'Pioggia moderata';
      if (isDay == 1) {
        img = 'assets/weather/Sun cloud mid rain.png';
      } else {
        img = 'assets/weather/Moon cloud mid rain.png';
      }
    } else if (code == 65) {
      weathercodeDescr = 'Pioggia intensa';
      if (isDay == 1) {
        img = 'assets/weather/Cloud big rain.png';
      } else {
        img = 'assets/weather/Cloud mid rain.png';
      }
    } else if (code == 66 || code == 67) {
      weathercodeDescr = 'Pioggia gelata';
      if (isDay == 1) {
        img = 'assets/weather/Cloud little snow.png';
      } else {
        img = 'assets/weather/Cloud little snow.png';
      }
    } else if (code == 71) {
      weathercodeDescr = 'Possibile nevischio';
      if (isDay == 1) {
        img = 'assets/weather/Sun cloud little snow.png';
      } else {
        img = 'assets/weather/Moon cloud little snow.png';
      }
    } else if (code == 73) {
      weathercodeDescr = 'nevischio';
      if (isDay == 1) {
        img = 'assets/weather/Sun cloud mid snow.png';
      } else {
        img = 'assets/weather/Moon cloud mid snow.png';
      }
    } else if (code == 75) {
      weathercodeDescr = 'Nevishio abbondante';
      if (isDay == 1) {
        img = 'assets/weather/Cloud snow.png';
      } else {
        img = 'assets/weather/Cloud snow.png';
      }
    } else if (code == 77) {
      weathercodeDescr = 'Snow grains';
      if (isDay == 1) {
        img = 'assets/weather/Cloud mid snow.png';
      } else {
        img = 'assets/weather/Cloud mid snow.png';
      }
    } else if (code == 80) {
      weathercodeDescr = 'Possibile acquazzone';
      if (isDay == 1) {
        img = 'assets/weather/Cloud mid rain.png';
      } else {
        img = 'assets/weather/Cloud mid rain.png';
      }
    } else if (code == 81) {
      weathercodeDescr = 'Acquazzone';
      if (isDay == 1) {
        img = 'assets/weather/Cloud mid rain.png';
      } else {
        img = 'assets/weather/Cloud mid rain.png';
      }
    } else if (code == 82) {
      if (isDay == 1) {
        weathercodeDescr = 'Acquazzone intenso';
        img = 'assets/weather/Big rain.png';
      } else {
        img = 'assets/weather/Big rain.png';
      }
    } else if (code == 85 || code == 86) {
      weathercodeDescr = 'Neve';
      if (isDay == 1) {
        img = 'assets/weather/Mid snow fast winds.png';
      } else {
        img = 'assets/weather/Mid snow fast winds.png';
      }
    } else if (code == 95 || code == 96 || code == 99) {
      weathercodeDescr = 'Temporale';
      if (isDay == 1) {
        img = 'assets/weather/Cloud angled rain zap.png';
      } else {
        img = 'assets/weather/Cloud angled rain zap.png';
      }
    }
  }
}
