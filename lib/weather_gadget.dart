import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherGadget extends StatefulWidget {
  const WeatherGadget({Key? key}) : super(key: key);

  @override
  _WeatherGadgetState createState() => _WeatherGadgetState();
}

class _WeatherGadgetState extends State<WeatherGadget> {
  WeatherFactory wf = WeatherFactory("foo",
      language: Language.RUSSIAN);
  String cityName = 'Rybinsk';
  Weather? _weather;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _weather == null ? wf.currentWeatherByCityName(cityName) : null,
      builder: ((BuildContext context, AsyncSnapshot<Weather> snapshot) {
        if (snapshot.hasData) {
          _weather = snapshot.data;
          return Row(
            children: [
              Text(
                _weather!.temperature!.celsius!.toInt().toString(),
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _weather!.areaName.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_weather!.weatherDescription.toString()),
                ],
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
