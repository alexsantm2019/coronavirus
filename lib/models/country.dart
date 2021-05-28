class Country {
  final String country;
  final String slug;
  final String ISO2;

  Country({this.country, this.slug, this.ISO2});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      country: json['Country'],
      slug: json['Slug'],
      ISO2: json['ISO2'],
    );
  }
}
