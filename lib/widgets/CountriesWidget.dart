import 'package:flutter/material.dart';
import 'package:global_coronavirus_info/models/country.dart';
import 'package:global_coronavirus_info/models/live.dart';
import 'package:global_coronavirus_info/services/services.dart';
import 'package:global_coronavirus_info/widgets/CountryCardWidget.dart';
import 'package:global_coronavirus_info/widgets/DetailCountry.dart';

class CountriesWidget extends StatefulWidget {
  @override
  _CountriesWidget createState() => _CountriesWidget();
}

class _CountriesWidget extends State<CountriesWidget> {
  Future<List<Country>> _countriesList;
  final Services _services = new Services();

  @override
  void initState() {
    super.initState();
    _countriesList = _services.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: FutureBuilder<List<Country>>(
            future: _countriesList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Country> countries = snapshot.data;
                countries.sort((a, b) => a.country.compareTo(b.country));
                return ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CountryCardWidget(
                    country: countries[index],
                    onTap: showDetail,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  void showDetail(Country country) async {
    await _services.getLiveByCountry(country.slug).then((val) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DetailCountry(countryInfo: val, country: country);
      }));
    }).catchError((error, stackTrace) {
      // error is SecondError
      print("outer: $error");
    });
  }
}
