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
      padding: const EdgeInsets.all(10.0),
      child: Container(
        //color: Colors.green[200],
        child: FutureBuilder<List<Country>>(
            future: _countriesList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Country> countries = snapshot.data;
                return ListView.separated(
                  itemCount: countries.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    color: Colors.orange[200],
                    indent: 45.0,
                    endIndent: 25.0,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      CountryCardWidget(
                    country: countries[index],
                    onTap: showDetail,
                    //onLongPress: markEmailAsRead,
                    //onSwipe: deleteEmail,
                  ),

                  // itemBuilder: (BuildContext context, int index) {
                  //   return Container(
                  //     height: 75,
                  //     color: Colors.white,
                  //     child: Center(
                  //       child: Text(countries[index].country),
                  //     ),
                  //   );
                  // }
                );
              } else if (snapshot.hasError) {
                //return Text("No  hay datos");
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  void showDetail(Country country) async {
    Live _countryInfo;
    _countryInfo = (await _services.getLiveByCountry(country.slug));
    print("===> In showDetail 1: $_countryInfo");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailCountry(countryInfo: _countryInfo);
    }));
  }
}
