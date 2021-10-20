import 'dart:convert';
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
   double? lat;
   double? long;
  @override
  void initState() {
    print('app started');
    getLocationData();
  }
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        URL:
 '//api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$APIKey');
    lat = location.longitude;
    long = location.latitude;
    print(lat);
    print(long);


    // var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
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
