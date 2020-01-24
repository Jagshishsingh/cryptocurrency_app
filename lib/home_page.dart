import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';


class HomePage extends StatefulWidget {
  List country_capital;
  List country_currency;
  HomePage(this.country_capital,this.country_currency);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MaterialColor> color_list = [Colors.green,Colors.blue,Colors.red,Colors.indigo,Colors.orange];
  //final List<MaterialColor> _colors = [Colors.blue,Colors.indigo,Colors.red];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Row(
          children: <Widget>[
            new Icon(Icons.location_on),
            new Padding(padding: const EdgeInsets.only(right: 10.0),),
            new Text("Countries",style: new TextStyle(fontSize: 20.0),),
          ],
        ),
      ),
    body: cryptoWidget(),
    );
  }
  Widget cryptoWidget(){
    return Container(child:new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            itemCount: widget.country_capital.length,
            itemBuilder: (BuildContext context,int index){
              final Map country_cap = widget.country_capital[index];
              final Map country_curr = widget.country_currency[index];
              final MaterialColor curr_color= color_list[index % color_list.length];
              return _getItemUi(country_cap['country'],country_cap['city'],country_curr['currency_name'],curr_color);
            },
            

          ),
        ),
      ],
    ),);
  }
  ListTile _getItemUi(String country,String capital,String currency,MaterialColor curr_color){
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: curr_color,
        child: new Text(country[0]),
      ),
      title: new Text(country,style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
      subtitle: _getSubtitle(capital,currency),
    );
  }

  Widget _getSubtitle(String capital,String currency){
    TextSpan capitalWidget = new TextSpan(text: "capital: $capital\n",style: new TextStyle(color: Colors.black));
    TextSpan currencyWidget = new TextSpan(text: "currency: $currency",style: new TextStyle(color: Colors.black));

    return new RichText(
      text: new TextSpan(children: [capitalWidget,currencyWidget]),
    );
  }
}





