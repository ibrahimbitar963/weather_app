import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';
import 'location_screen.dart';
import 'package:weather_app/services/networking.dart';

const APIKey = 'a4c2e710dc3801ee47d1aee520344fa8';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    print('app started');
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon='
    '${location.longitude}&appid=$APIKey&units=metric');
    var weatherData = await networkHelper.getData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationwethar: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white10,
          size: 100,
        ),
      ),
      // body: Center(
      //   child: RaisedButton(
      //     onPressed: () {
      //               getLocation();
      //                 },
      //     child: Text('Get Location'),
      //   ),
      // ),
    );
  }
}
