import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/screens/widgets/search_widget.dart';
import 'package:weather_app/screens/widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff011b54),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: <Widget>[
                const SearchWidget(),
                Expanded(
                    child: WeatherCard(
                  model: WeatherModel(
                      cityName: "تهران",
                      statusCode: 200,
                      temperature: 20,
                      weatherCondition: "افتابی",
                      weatherConditionEn: "sunny",
                      humidity: 25,
                      windSpeed: 22,
                      icon: "01n",
                      iconUrl: "https://openweathermap.org/img/wn/10n@4x.png"),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
