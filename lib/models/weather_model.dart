class Weather {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int windDegree;
  final String description;
  final String icon;
  final double rainVolume;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDegree,
    required this.description,
    required this.icon,
    required this.rainVolume,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      windDegree: json['wind']['deg'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      rainVolume: json['rain'] != null ? json['rain']['1h'] : 0.0,
    );
  }
}
