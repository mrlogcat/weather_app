import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.model});
  final WeatherModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      child: Card(
        color: Colors.white12,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    model.cityName,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.network(
                    fit: BoxFit.cover,
                    model.iconUrl!,
                    width: 220,
                    height: 220,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : CircularProgressIndicator(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 160),
                    child: Text(
                      "${model.temperature.toInt()}" "\u2103",
                      style:
                          const TextStyle(fontSize: 100, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Text(
                "${model.weatherCondition}",
                style: const TextStyle(fontSize: 28, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${model.humidity}%  :رطوبت ",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Icon(
                          Icons.water_drop_outlined,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${model.windSpeed.toInt()} km/h  :سرعت باد ",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Icon(
                          Icons.speed_outlined,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
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
