import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:global_coronavirus_info/models/live.dart';
import 'package:latlong/latlong.dart';

class MapWidget extends StatefulWidget {
  Live countryInfo;
  MapWidget({Key key, @required this.countryInfo}) : super(key: key);

  @override
  _MapWidget createState() => _MapWidget();
}

class _MapWidget extends State<MapWidget> {
  Live countryInfo;
  MapController mapController;
  double maxZoom = 15.0;
  double minZoom = 4.0;
  double zoom = 5.0;
  initState() {
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  center: LatLng(double.parse(widget.countryInfo.lat),
                      double.parse(widget.countryInfo.lon)),
                  onTap: (pos) {
                    final snackBar = SnackBar(
                        content: Text(widget.countryInfo.country +
                            ' ' +
                            '(' +
                            'Lat: ' +
                            widget.countryInfo.lat +
                            ' - Long: ' +
                            widget.countryInfo.lon +
                            ')'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  zoom: 5,
                  maxZoom: this.maxZoom,
                  minZoom: this.minZoom,
                ),
                layers: [
                  TileLayerOptions(
                      minZoom: 2,
                      maxZoom: 18,
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 5.0,
                        height: 5.0,
                        point: LatLng(double.parse(widget.countryInfo.lat),
                            double.parse(widget.countryInfo.lon)),
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
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.0, bottom: 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.teal[300],
                    heroTag: "btn1",
                    tooltip: "Zoom In",
                    onPressed: () => _zoomPlus(),
                    child: Icon(Icons.zoom_in),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.teal[300],
                    heroTag: "btn2",
                    tooltip: "Zoom Out",
                    onPressed: () => _zoomMinus(),
                    child: Icon(Icons.zoom_out),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _zoomPlus() {
    LatLng currentCenter = LatLng(double.parse(widget.countryInfo.lat),
        double.parse(widget.countryInfo.lon));
    setState(() {
      zoom++;
    });
    mapController.move(currentCenter, zoom);
  }

  void _zoomMinus() {
    LatLng currentCenter = LatLng(double.parse(widget.countryInfo.lat),
        double.parse(widget.countryInfo.lon));
    setState(() {
      zoom--;
    });
    mapController.move(currentCenter, zoom);
  }
}
