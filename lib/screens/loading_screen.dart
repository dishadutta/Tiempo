import 'package:flutter/material.dart';
import 'package:tiempo/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tiempo/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();

  }

  void getLocationData() async{

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
          locationWeather: weatherData
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      body: Center(
        child: SpinKitPulse(
            color: Colors.white,
            size: 100
        ),
      ),
    );
  }
}
