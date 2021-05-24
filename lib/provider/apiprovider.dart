import 'package:flutter/material.dart';

class Apiprovider with ChangeNotifier {
  String apiUrl = "https://api.covid19api.com/";

  String getUrl() {
    notifyListeners();
    return apiUrl;
  }
}
