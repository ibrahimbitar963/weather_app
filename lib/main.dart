import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/services/weather.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
      ),

      home: LoadingScreen(),
    );
  }
}
