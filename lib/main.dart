import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';
import 'home_page.dart';
void main() async{
  List country_capital = await capital_get();
  List country_currency = await currency_get();
  runApp(new MyApp(country_capital,country_currency));
}

class MyApp extends StatelessWidget {
  List country_capital;
  List country_currency;
  MyApp(this.country_capital,this.country_currency);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "countries",
      theme: new ThemeData(primarySwatch: Colors.teal),
      home: new HomePage(country_capital,country_currency),
    );
  }
}
Future <List> capital_get() async{
  final String country_capital_url = "https://raw.githubusercontent.com/samayo/country-json/master/src/country-by-capital-city.json";
  http.Response capital = await http.get(country_capital_url);
  return json.decode(capital.body);
}
Future <List> currency_get() async{
  final String country_currency_url = "https://raw.githubusercontent.com/samayo/country-json/master/src/country-by-currency-name.json";
  http.Response currency = await http.get(country_currency_url);
  return json.decode(currency.body);
}