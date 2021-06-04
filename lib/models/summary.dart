class Summary {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  DateTime date;

  Summary(
      {newConfirmed,
      totalConfirmed,
      newDeaths,
      totalDeaths,
      newRecovered,
      totalRecovered,
      date}) {
    this.newConfirmed;
    this.totalConfirmed;
    this.newDeaths;
    this.totalDeaths;
    this.newRecovered;
    this.totalRecovered;
    this.date;
  }

  Summary.fromJson(Map<String, dynamic> json) {
    newConfirmed = json['Global']['NewConfirmed'];
    totalConfirmed = json['Global']['TotalConfirmed'];
    newDeaths = json['Global']['NewDeaths'];
    totalDeaths = json['Global']['TotalDeaths'];
    newRecovered = json['Global']['NewRecovered'];
    totalRecovered = json['Global']['TotalRecovered'];
    date = json['Global']['date'];
  }
}
