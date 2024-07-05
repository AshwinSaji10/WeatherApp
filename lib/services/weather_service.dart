import 'package:dio/dio.dart';

class WeatherService {
  final String apiKey = '175e5459cc056ced55fab242a7d93640';
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchWeather(
      double latitude, double longitude) async {
    try {
      final response = await _dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': apiKey,
          'units': 'metric',
        },
      );

      return response.data;
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }
}
