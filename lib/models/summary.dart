class Summary {
  int? newConfirmed;
  int? totalConfirmed;
  int? newDeaths;
  int? totalDeaths;
  int? newRecovered;
  int? totalRecovered;

  Summary(
      {newConfirmed,
      totalConfirmed,
      newDeaths,
      totalDeaths,
      newRecovered,
      totalRecovered}) {
    this.newConfirmed;
    this.totalConfirmed;
    this.newDeaths;
    this.totalDeaths;
    this.newRecovered;
    this.totalRecovered;
  }

  Summary.fromJson(Map<String, dynamic> json) {
    newConfirmed = json['Global']['NewConfirmed'];
    totalConfirmed = json['Global']['TotalConfirmed'];
    newDeaths = json['Global']['NewDeaths'];
    totalDeaths = json['Global']['TotalDeaths'];
    newRecovered = json['Global']['NewRecovered'];
    totalRecovered = json['Global']['TotalRecovered'];
  }
/*   factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      newConfirmed: json['Global']['NewConfirmed'],
      totalConfirmed: json['Global']['TotalConfirmed'],
      newDeaths: json['Global']['NewDeaths'],
      totalDeaths: json['Global']['TotalDeaths'],
      newRecovered: json['Global']['NewRecovered'],
      totalRecovered: json['Global']['TotalRecovered'],
    );
  } */
}

/* Summary postFromJson(String str) {
  final jsonData = json.decode(str);
  return Summary.fromJson(jsonData);
} */
/* 
List<Summary> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Summary>.from(jsonData.map((x) => Summary.fromJson(x)));
} */
