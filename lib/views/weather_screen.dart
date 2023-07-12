import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometeo_riverpod/logic/providers/providers.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(positionProvider);
    final _weather = ref.watch(weatherProvider);
    final _city = ref.watch(cityNameProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on_sharp),
                Text(_city.value.toString()),
              ],
            ),
            Text(_weather.value!.dateToday.toString()),
            Text(_weather.value!.temperature!.toInt().toString()),
          ],
        ),
      ),
    );
  }
}
