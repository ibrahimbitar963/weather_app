import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationwethar});
  var locationwethar;
  
  @override
  _LocationScreenState createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather=WeatherModel();
  int? temperature;
  String? weatherIcon;
  String? weatherTemp;
  String? cityname;

  @override
  void initState() {
    updateUI(widget.locationwethar);
  }
  void updateUI(dynamic weatherData){
    setState(() {
      double temp =weatherData['main']['temp'];
      temperature=temp.toInt();
      var condition  =weatherData['weather'][0]['id'];
      cityname = weatherData['name'];
      weatherIcon= weather.getWeatherIcon(condition!);
      weatherTemp=weather.getMessage(temperature!);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon!,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherTemp in $cityname!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


