class WeatherModel {
  final String cityName;
  final int statusCode;
  final double temperature;
  final String weatherCondition;
  final String weatherConditionEn;
  final String icon;
  String? iconUrl;
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.cityName,
    required this.statusCode,
    required this.temperature,
    required this.weatherCondition,
    required this.weatherConditionEn,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      statusCode: json['cod'],
      temperature: json['main']['temp'].toDouble(),
      weatherCondition: json['weather'][0]['description'],
      weatherConditionEn: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
}
