import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wether_app/Model/apimodel.dart';

class api_helper {
  api_helper._();

  static api_helper api = api_helper._();

  Future getdata({required String search_data}) async {
    String Search = search_data;
    var wether = await http.get(
      Uri.parse(
          "http://api.weatherapi.com/v1/forecast.json?key=3c5009be4d49494f9d245829232208&q=$Search&days=1&aqi=no&alerts=no"),
    );
    if (wether.statusCode == 200) {
      var body = wether.body;
      Map decodegata = jsonDecode(body);
      api_model data = api_model.js(data: decodegata);
      return data;
    } else {
      return null;
    }
  }
}
