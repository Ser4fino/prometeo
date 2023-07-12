import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../models/weather_model.dart';

final ServiceProvider = FutureProvider((ref) async => CallApi().getWeather());

class CallApi {
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  }

  Future<WeatherModel> getWeather() async {
    Position position = await getCurrentPosition();
    var lat = position.latitude;
    print('>>>  ${lat}');
    var long = position.longitude;
    print('>>>  ${long}');

    Uri url = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=${lat.toString()}&longitude=${long.toString()}&daily=weathercode&current_weather=true&timezone=Europe/London');
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> decodeJson = json.decode(response.body);
      return WeatherModel.fromJson(decodeJson);
    } else {
      throw Exception('Failed');
    }
  }

  Future<String> getCityName(double lat, double long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    return placemarks[0].locality!;
  }
}
