import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/data/models/weather_model.dart';

class WeatherService {
  WeatherService._();
  static final WeatherService _instance = WeatherService._();

  factory WeatherService() {
    return _instance;
  }

  final String _baseUrl = 'api.openweathermap.org';
  final String _path = '/data/2.5/weather';
  final String _apiKey = 'e42f46faaef415f0d37a26c37303807b';

  Future<WeatherModel> getWeather(String city) async {
    var url = Uri.https(_baseUrl, _path,
        {'q': city, 'appid': _apiKey, 'units': 'metric', 'lang': 'fa'});

    try {
      final response = await http.get(url);
      switch (response.statusCode) {
        case 200:
          final Map<String, dynamic> data = jsonDecode(response.body);
          WeatherModel model = WeatherModel.fromJson(data);
          model.iconUrl = _getIconUrl(model.icon);
          return model;

        case 401:
          throw CustomException("خطای احراز هویت");
        case 404:
          throw CustomException("شهر مورد نظر یافت نشد");
        default:
          throw CustomException(" خطای تعریف نشده");
      }
    } catch (e) {
      if (e is CustomException) {
        rethrow;
      } else {
        throw CustomException("خطایی در ارتباط رخ داده است");
      }
    }
  }

  String _getIconUrl(String icon) {
    final String iconUrl = "https://openweathermap.org/img/wn/$icon@4x.png";
    return iconUrl;
  }
}

class CustomException implements Exception {
  final String message;
  final int? statusCode;
  CustomException(this.message, {this.statusCode});

  @override
  String toString() => message;
}
