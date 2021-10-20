import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.URL});
  late String URL;
  Future  getData() async {
    http.Response response = await http.get(URL);
    // print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);


    } else {
      print(response.statusCode);
    }
  }
}
