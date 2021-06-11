import 'package:flutter/material.dart';
import '../constants.dart';

Widget SummaryCardWidget(
    {IconData icon, String value, String label, Color color}) {
  return Container(
      width: 175,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withAlpha(200),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 5),
          borderRadius: BorderRadius.circular(15),
        ),
        color: color,
        elevation: 15,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 5.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Icon(
                icon,
                size: 35,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(label, style: cardStatusTitleStyle),
            Text(value, style: cardStatusSubTitleStyle),
          ],
        ),
      ));
}
