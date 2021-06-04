import 'dart:convert';
import 'package:global_coronavirus_info/models/live.dart';
import 'package:global_coronavirus_info/models/summary.dart';
import 'package:global_coronavirus_info/models/country.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../conf/configuration.dart';

class Services {
  var urlSummary = Uri.https(BASE, PATH_SUMMARY);
  var urlCountries = Uri.https(BASE, PATH_COUNTRIES);

  Future<Summary> getSummary() async {
    try {
      final response = await http.get(urlSummary);
      var parsedJson = Summary.fromJson(json.decode(response.body));
      return parsedJson;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<Country>> getCountries() async {
    try {
      final response = await http.get(urlCountries);
      var parsedJson = json.decode(response.body);
      return parsedJson
          .map<Country>((data) => new Country.fromJson(data))
          .toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Live> getLiveByCountry(country) async {
    final now = new DateTime.now();
    var dateSearch = new DateTime(now.year, now.month, now.day - 1);
    var urlByCountry =
        'https://api.covid19api.com/live/country/$country/status/confirmed/date/$dateSearch';
    try {
      final response = await http.get(Uri.parse(urlByCountry));
      var parsedJson = json.decode(response.body).last;
      final arraySend = Live.fromJson(parsedJson);
      return arraySend;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
