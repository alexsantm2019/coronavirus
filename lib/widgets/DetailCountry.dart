import 'package:flutter/material.dart';
import 'package:global_coronavirus_info/models/live.dart';
import 'package:global_coronavirus_info/widgets/MapWidget.dart';
import 'package:global_coronavirus_info/screens/ErrorScreen.dart';
import '../constants.dart';
import 'package:global_coronavirus_info/models/country.dart';

class DetailCountry extends StatelessWidget {
  final Live countryInfo;
  final Country country;

  DetailCountry({@required this.countryInfo, this.country});

  @override
  Widget build(BuildContext context) {
    var imageCountry = country.ISO2;
    if (countryInfo != null)
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "https://www.countryflags.io/$imageCountry/flat/32.png"),
              Container(
                  padding: const EdgeInsets.all(5.0),
                  child:
                      Text(countryInfo.country, style: titleDetailCountryStyle))
            ],
          ),
          backgroundColor: Colors.indigo[200],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                StatusInfoBox(
                    textValue: countryInfo.confirmed,
                    icon: Icons.king_bed_rounded,
                    color: Colors.blue,
                    title: "Confirmed"),
                StatusInfoBox(
                    textValue: countryInfo.recovered,
                    icon: Icons.assignment_turned_in_outlined,
                    color: Colors.green,
                    title: "Recovered"),
                StatusInfoBox(
                    textValue: countryInfo.deaths,
                    icon: Icons.cancel,
                    color: Colors.red,
                    title: "Deaths"),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              width: 610,
              height: 450,
              constraints: BoxConstraints(maxWidth: 400),
              padding: EdgeInsets.all(5),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
              child: MapWidget(countryInfo: countryInfo),
            ),
          ],
        )),
      );
    else
      return ErrorScreen();
  }

  Widget StatusInfoBox({textValue, IconData icon, Color color, String title}) {
    return Container(
        width: 135,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white.withAlpha(200),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: color,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 5.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  icon,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5.0),
              Text(textValue.toString(), style: cardStatusTitleStyle),
              Text(title.toString(), style: cardStatusSubTitleStyle),
            ],
          ),
        ));
  }
}
