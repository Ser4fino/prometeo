import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometeo_riverpod/models/weather_model.dart';
import 'package:prometeo_riverpod/services/call_api.dart';

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
    //final _weather = ref.watch(ServiceProvider);
    var _weather;
    String _temp = '';
    String _descr = '';
    String _date = '';
    String _code = '';
    String _img = '';

    AsyncValue<WeatherModel> weatherProvider = ref.watch(ServiceProvider);
    weatherProvider.when(
        loading: () => const CircularProgressIndicator(),
        error: (err, r) => Text(err.toString()),
        data: (weather) {
          _temp = weather.temperature!.toInt().toString();
          _descr = weather.weathercodeDescr.toString();
          _date = weather.dateToday.toString();
          _code = weather.code.toString();
          _img = weather.img.toString();
          print(_img);

          //_data = weather.dateToday;
        });

    return Scaffold(
      body: Container(
        height: 700,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        'cityname',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      _date,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18)),
                      Column(
                        children: [
                          Text(
                            '$_temp°',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _descr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Image.asset(
                        _img,
                        width: 250,
                        filterQuality: FilterQuality.medium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
