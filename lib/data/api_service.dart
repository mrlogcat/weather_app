import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/data/models/weather_model.dart';

class WeatherService {
  final String baseUrl = 'api.openweathermap.org';
  final String path = '/data/2.5/weather';
  final String apiKey = 'e42f46faaef415f0d37a26c37303807b';

  Future<WeatherModel?> fetchWeather(String city) async {
    var url = Uri.https(baseUrl, path,
        {'q': city, 'appid': apiKey, 'units': 'metric', 'lang': 'fa'});

    try {
      final response = await http.get(url);
      switch (response.statusCode) {
        case 200:
          final Map<String, dynamic> data = jsonDecode(response.body);
          WeatherModel? model = WeatherModel.fromJson(data);
          model.iconUrl = _getIconUrl(model.icon);
          return model;

        case 401:
          throw Exception("خطای احراز هویت");
        case 404:
          throw Exception("شهر مورد نظر یافت نشد!");
        case 500:
          throw Exception("خطای سرور! لطفا بعدا امتحان کنید");

        default:
          throw Exception("خطای نامشخص! کد خطا ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("خطا در دریافت اطلاعات : $e");
    }
  }

  String _getIconUrl(String icon) {
    final String iconUrl = "https://openweathermap.org/img/wn/$icon@4x.png";
    return iconUrl;
  }
}
