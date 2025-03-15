import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.model});
  final WeatherModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff294479),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                model.cityName,
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
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
                          : const CircularProgressIndicator(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 160),
                  child: Text(
                    "${model.temperature.toInt()}" "\u2103",
                    style: const TextStyle(fontSize: 100, color: Colors.white),
                  ),
                ),
              ],
            ),
            Text(
              "${model.weatherCondition}",
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
            SizedBox(
              height: 64,
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const Icon(
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const Icon(
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
    );
  }
}
