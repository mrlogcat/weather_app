import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.model});
  final WeatherModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            model.cityName,
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          Stack(
            children: [
              Image.network(
                model.iconUrl!,
                width: 100,
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.only(top: 130),
                child: Text(
                  "${model.temperature.toString()}" "\u2103",
                  style: const TextStyle(fontSize: 100, color: Colors.white),
                ),
              ),
            ],
          ),
          Text(
            "${model.weatherCondition}",
            style: const TextStyle(fontSize: 28, color: Colors.white),
          ),
          const SizedBox(
            height: 56,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.water_drop_outlined,
                      color: Colors.white,
                      size: 14,
                    ),
                    Text(
                      "رطوبت",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.storm_outlined,
                      color: Colors.white,
                      size: 14,
                    ),
                    Text(
                      "سرعت باد",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child:
                  ElevatedButton(onPressed: () {}, child: const Text("data")))
        ],
      ),
    );
  }
}
