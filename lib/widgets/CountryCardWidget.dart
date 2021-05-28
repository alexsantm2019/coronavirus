import 'package:flutter/material.dart';
import 'package:global_coronavirus_info/models/country.dart';
import '../constants.dart';

class CountryCardWidget extends StatelessWidget {
  final Country country;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  CountryCardWidget({
    Key key,
    @required this.country,
    this.onTap,
    this.onSwipe,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageCountry = country.ISO2;
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(country.slug);
      },
      onLongPress: () {
        onLongPress(country.slug);
      },
      onTap: () {
        onTap(country);
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        height: 70.0,
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    leading: Image.network(
                        "https://www.countryflags.io/$imageCountry/flat/32.png"),
                    title: Text(country.country, style: fromTextStyle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
