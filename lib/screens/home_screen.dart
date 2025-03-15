import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/screens/widgets/search_widget.dart';
import 'package:weather_app/screens/widgets/weather_card.dart';
import 'package:weather_app/data/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchedCity = "tehran";
  bool loading = false;
  String errorMessage = "";
  WeatherModel? dataModel;
  @override
  void initState() {
    fetchWeather('tehran');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: const Color(0xff04215d),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 48, bottom: 28, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SearchWidget(
                callback: (searchedCity) {
                  this.searchedCity = searchedCity;
                  fetchWeather(searchedCity);
                },
              ),
              SingleChildScrollView(
                child: loading
                    ? const Center(child: CircularProgressIndicator())
                    : (dataModel != null
                        ? WeatherCard(model: dataModel!)
                        : Center(
                            //if loading false && data==null we have an error
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$errorMessage",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        fetchWeather(searchedCity);
                                      },
                                      child: Text("تلاش مجدد")),
                                )
                              ],
                            ),
                          )),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        fetchWeather(searchedCity);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "بروز رسانی",
                            style: TextStyle(color: Colors.black87),
                          ),
                          Icon(
                            Icons.refresh,
                            color: Colors.black87,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<WeatherModel?> fetchWeather(String city) async {
    setState(() {
      loading = true;
      errorMessage = "";
    });
    var service = WeatherService();
    try {
      var data = await service.getWeather(city);
      setState(() {
        this.dataModel = data;
        loading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      setState(() {
        loading = false;
        errorMessage = e.toString();
        this.dataModel = null;
      });
      return null;
    }
  }
}
