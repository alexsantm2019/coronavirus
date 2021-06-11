import 'package:flutter/material.dart';
import 'package:global_coronavirus_info/models/summary.dart';
import 'package:global_coronavirus_info/services/services.dart';
import 'package:global_coronavirus_info/widgets/SummaryCardWidget.dart';
import 'package:intl/intl.dart';

class SummaryWidget extends StatefulWidget {
  @override
  _SummaryWidget createState() => _SummaryWidget();
}

class _SummaryWidget extends State<SummaryWidget> {
  Future<Summary> _summaryList;
  final Services _services = new Services();

  @override
  void initState() {
    super.initState();
    _summaryList = _services.getSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        //color: Colors.white,
        color: Colors.blue[100],
        child: FutureBuilder<Summary>(
            future: _summaryList,
            builder: (context, AsyncSnapshot<Summary> snapshot) {
              if (snapshot.hasData) {
                var newConfirmed =
                    NumberFormat.compact().format(snapshot.data?.newConfirmed);
                var totalConfirmed = new NumberFormat.compact()
                    .format(snapshot.data?.totalConfirmed);
                var newDeaths =
                    new NumberFormat.compact().format(snapshot.data?.newDeaths);
                var totalDeaths = new NumberFormat.compact()
                    .format(snapshot.data?.totalDeaths);
                var newRecovered = new NumberFormat.compact()
                    .format(snapshot.data?.newRecovered);
                var totalRecovered = new NumberFormat.compact()
                    .format(snapshot.data?.totalRecovered);
                var date = snapshot.data?.date;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SummaryCardWidget(
                          icon: Icons.sick_sharp,
                          value: newConfirmed.toString(),
                          label: "New Confirmed",
                          color: Colors.yellow[700],
                        ),
                        SummaryCardWidget(
                          icon: Icons.sick_sharp,
                          value: totalConfirmed.toString(),
                          label: "Total Confirmed",
                          color: Colors.yellow[700],
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SummaryCardWidget(
                          icon: Icons.sentiment_very_dissatisfied_rounded,
                          value: newDeaths.toString(),
                          label: "New Deaths",
                          color: Colors.redAccent,
                        ),
                        SummaryCardWidget(
                          icon: Icons.sentiment_very_dissatisfied_rounded,
                          value: totalDeaths.toString(),
                          label: "Total Deaths",
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SummaryCardWidget(
                          icon: Icons.sentiment_very_satisfied,
                          value: newRecovered.toString(),
                          label: "New Recovered",
                          color: Colors.green[400],
                        ),
                        SummaryCardWidget(
                          icon: Icons.sentiment_very_satisfied,
                          value: totalRecovered.toString(),
                          label: "Total Recovered",
                          color: Colors.green[400],
                        ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
