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
      onLongPress: () {
        onLongPress(country.slug);
      },
      onTap: () {
        onTap(country);
      },
      child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue[300], width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          color: Colors.blue[100],
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.network(
                    "https://www.countryflags.io/$imageCountry/flat/32.png"),
                SizedBox(width: 30),
                Text(country.country, style: fromTextStyle),
                // SizedBox(width: 60),
                // Icon(
                //   Icons.remove_red_eye_rounded,
                //   size: 15,
                //   color: Colors.white,
                // )
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Icon(
                //     Icons.remove_red_eye_rounded,
                //     size: 15,
                //     color: Colors.white,
                //   ),
                // )
                // ,
              ],
            ),
          )),
      //),
    );
  }
}
