import 'dart:convert';
import 'package:covid19app/data_source.dart';
import 'package:covid19app/panels/most_effected_countries.dart';
import 'package:covid19app/panels/world_wide_panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;

  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countriesData;

  fetchCountriesData() async {
    http.Response response = await http.get(
        'https://corona.lmao.ninja/v2/countries');
    setState(() {
      countriesData = json.decode(response.body);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWorldWideData();
    fetchCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('COVID-19 Panel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                  DataSource.quote,
                  style: TextStyle(
                      color: Colors.orange[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Worldwide',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primaryBlack,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Regional',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData == null ? CircularProgressIndicator() : WorldWidePanel(
              worldWide: worldData,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Worldwide',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            countriesData == null ? Container() : MostAffectedPanel(countryData: countriesData,)
          ],
        ),
      ),
    );
  }
}
