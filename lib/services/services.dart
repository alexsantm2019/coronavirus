import 'dart:convert';
import 'package:global_coronavirus_info/models/summary.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
//import 'package:global_coronavirus_info/conf/configuration.dart';

class Services {
  //Summary summaryServices = Summary();
  /*  final String PATH_SUMMARY = 'summary';
  final _headers = {'Content-Type': 'application/json'};
  final String finalUrl = BASE + PATH_SUMMARY; */

  Uri apiUrl = Uri.parse("https://api.covid19api.com/summary");

  // ignore: unused_element
  Future<Summary> _getSummary() async {
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      return Summary.fromJson(json.decode(response.body));
    } else {
      throw Exception("Fallo la conexion");
    }
  }

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
}
