import 'package:covid19app/data_source.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('COVID-19 Panel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                  DataSource.quote,
                  style: TextStyle(
                    color: Colors.orange[800] ,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
