import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:global_coronavirus_info/models/country.dart';
import 'package:global_coronavirus_info/models/live.dart';
import 'package:latlong/latlong.dart';

class MapWidget extends StatelessWidget {
  Live countryInfo;
  MapWidget({Key key, @required this.countryInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(
            double.parse(countryInfo.lat), double.parse(countryInfo.lon)),
        onTap: (pos) {
          print(pos);
          //_showDialog(pos);
          final snackBar = SnackBar(
              content: Text(countryInfo.country +
                  ' ' +
                  '(' +
                  'Lat: ' +
                  countryInfo.lat +
                  ' - Long: ' +
                  countryInfo.lon +
                  ')'));
          Scaffold.of(context).showSnackBar(snackBar);
        },
        zoom: 5,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 5.0,
              height: 5.0,
              point: LatLng(
                  double.parse(countryInfo.lat), double.parse(countryInfo.lon)),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.location_on,
                  size: 55,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
