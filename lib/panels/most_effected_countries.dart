import 'package:flutter/material.dart';


class MostAffectedPanel extends StatelessWidget {

  final List countryData;
  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              children: <Widget>[
                Image.network(countryData[index]['countryInfo']['flag'], height: 30,),
                Text(countryData[index]['country'], style: TextStyle(fontWeight: FontWeight.bold), ),
                Text(countryData[index]['deaths'].toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                ),
                )

              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
