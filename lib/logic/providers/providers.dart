import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:prometeo_riverpod/logic/services/call_api.dart';

final positionProvider = FutureProvider((ref) {
  return ref.watch(serviceProvider).getCurrentPosition();
});

final weatherProvider = FutureProvider((ref) async {
  final lat = await ref.read(positionProvider).value!.latitude;
  final long = await ref.read(positionProvider).value!.longitude;
  return await ref.watch(serviceProvider).getWeather(lat, long);
});

final cityNameProvider = FutureProvider((ref) async {
  final lat = await ref.read(positionProvider).value!.latitude;
  final long = await ref.read(positionProvider).value!.longitude;
  return await ref.watch(serviceProvider).getCityName(lat, long);
});
