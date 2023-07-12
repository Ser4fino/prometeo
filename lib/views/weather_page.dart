import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';

import '../logic/providers/providers.dart';
import '../logic/services/call_api.dart';

class WeatherPage extends ConsumerWidget {
  WeatherPage({super.key});

  //final city = Provider((ref) => ref.watch(cityNameProvider));
  //final currentWeather = Provider((ref) => ref.watch(weatherProvider));
  final position = StateProvider((ref) => ref.watch(positionProvider));

  final weatherProv = Provider((ref) => ref.watch(weatherProvider));
  final cityNameProv = Provider((ref) => ref.watch(cityNameProvider));
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final name = ref.watch(city);
    final pos = Provider((ref) => ref.watch(position));
    final weather = Provider((ref) => ref.watch(weatherProv));
    final temp = ref.read(weather).value!.temperature!.toInt().toString();
    final desc = ref.read(weather).value!.weathercodeDescr;
    final city = ref.read(cityNameProv).value;
    final date = ref.read(weather).value?.dateToday;
    print(date);
    print(city);
    final code = ref.read(weather).value?.code;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Container(
                  height: 400,
                  width: 400,
                  color: Colors.amber,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          city.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
