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
    //var urlByCountry = Uri.https(PATH_COUNTRIES_LIVE, country);
    //var urlByCountry = 'https://api.covid19api.com/live/country/$country';
    final now = new DateTime.now();
    var dateSearch = new DateTime(now.year, now.month, now.day - 1);
    var urlByCountry =
        'https://api.covid19api.com/live/country/$country/status/confirmed/date/$dateSearch';
    try {
      final response = await http.get(Uri.parse(urlByCountry));
      var parsedJson = json.decode(response.body).last;
      final arraySend = Live.fromJson(parsedJson);
      // print("======> Array:");
      // print(arraySend);
      return arraySend;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}



/*   Future<Summary> _getSummary() async {
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      return Summary.fromJson(json.decode(response.body));
    } else {
      throw Exception("Fallo la conexion");
    }
  } */

/*   Future<Summary> _getSummary() async {
    List<Summary> summary = [];
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      //return postFromJson(response.body);
      return Summary.fromJson(json.decode(response.body));

      /*    String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var item in jsonData['Global']) {
        summary.add(Summary(
            newConfirmed: item['NewConfirmed'],
            totalConfirmed: item['TotalConfirmed'],
            newDeaths: item['NewDeaths'],
            totalDeaths: item['TotalDeaths'],
            newRecovered: item['NewRecovered'],
            totalRecovered: item['TotalRecovered']));
      }
      print(response.body);
      return summary; */
      //return postFromJson(response.body);
    } else {
      throw Exception("Fallo la conexion");
    }
  } */

/*     Future<List<Summary>> _getSummary() async {
    List<Summary> summary = [];
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {

      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var item in jsonData['Global']) {
        summary.add(Summary(
            newConfirmed: item['NewConfirmed'],
            totalConfirmed: item['TotalConfirmed'],
            newDeaths: item['NewDeaths'],
            totalDeaths: item['TotalDeaths'],
            newRecovered: item['NewRecovered'],
            totalRecovered: item['TotalRecovered']));
      }
      print(response.body);
      return summary;
      //return postFromJson(response.body);
    } else {
      throw Exception("Fallo la conexion");
    }
  } */

/*   Future<Summary> _getSummary() async {
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      //return postFromJson(response.body);
      print(response.body);
      return postFromJson(response.body);
    } else {
      throw Exception("Fallo la conexion");
    }
  } */

/*   Future<List<Summary>> getCases() async {
    http.Response res = await http.get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Summary> cases =
          body.map((dynamic item) => Cases.fromJson(item)).toList();
      return cases;
    } else {
      throw "Failed to load cases list";
    }
  } */

