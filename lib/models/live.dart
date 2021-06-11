class Live {
  String id;
  String country;
  String countryCode;
  String lat;
  String lon;
  int confirmed;
  int deaths;
  int recovered;
  int active;
  String date;
  Live(
      {this.id,
      this.country,
      this.countryCode,
      this.lat,
      this.lon,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.active,
      this.date});

  factory Live.fromJson(Map<String, dynamic> json) {
    return Live(
        id: json['ID'],
        country: json['Country'],
        countryCode: json['CountryCode'],
        lat: json['Lat'],
        lon: json['Lon'],
        confirmed: json['Confirmed'],
        deaths: json['Deaths'],
        recovered: json['Recovered'],
        active: json['Active'],
        date: json['Date']);
  }
}
