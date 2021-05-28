import 'package:flutter/material.dart';
import 'package:global_coronavirus_info/models/live.dart';
import 'package:global_coronavirus_info/services/services.dart';
import '../constants.dart';
import 'package:global_coronavirus_info/models/country.dart';

class DetailCountry extends StatelessWidget {
  final Live countryInfo;
  //List<> countryInfo;
  //final Future<List<Live>> countryInfo;

  DetailCountry({@required this.countryInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(countryInfo.country),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Code: ${countryInfo.countryCode}', style: fromTextStyle),
              SizedBox(height: 10.0),
              Text('Lat: ${countryInfo.lat}', style: subjectTextStyle),
              SizedBox(height: 5.0),
              Text('Long: ${countryInfo.lon}', style: subjectTextStyle),
              SizedBox(height: 10.0),
              Text('Confirmed: ${countryInfo.confirmed}',
                  style: subjectTextStyle),
              SizedBox(height: 10.0),
              Text('Deaths: ${countryInfo.deaths}', style: subjectTextStyle),
              SizedBox(height: 10.0),
              Text('Recovered: ${countryInfo.recovered}',
                  style: subjectTextStyle),
              SizedBox(height: 10.0),
              Text('Active: ${countryInfo.active}', style: subjectTextStyle),
              SizedBox(height: 10.0),
              Text('Date: ${countryInfo.date}', style: subjectTextStyle),
            ],
          ),
        ));
  }
}
