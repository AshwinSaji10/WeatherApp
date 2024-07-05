import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:weather_app/pages/add_location.dart";
import 'package:weather_app/components/weather_card.dart';

import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/models/weather_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  String _errorMessage = '';

  Future<void> _getWeather() async {
    try {
      final double _latitude = 19.0144; // Mumbai latitude
      final double _longitude = 72.8479; // Mumbai longitude
      final weatherData =
          await _weatherService.fetchWeather(_latitude, _longitude);
      setState(() {
        _weather = Weather.fromJson(weatherData);
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load weather data';
        _weather = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _getWeather();
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: WeatherCard(
                  weatherData: _weather,
                  errorMsg: _errorMessage,
                ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => const AddLocation()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
