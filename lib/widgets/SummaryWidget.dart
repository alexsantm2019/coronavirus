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
                var newConfirmed = new NumberFormat("#,###")
                    .format(snapshot.data?.newConfirmed);
                var totalConfirmed = new NumberFormat("#,###")
                    .format(snapshot.data?.totalConfirmed);
                var newDeaths =
                    new NumberFormat("#,###").format(snapshot.data?.newDeaths);
                var totalDeaths = new NumberFormat("#,###")
                    .format(snapshot.data?.totalDeaths);
                var newRecovered = new NumberFormat("#,###")
                    .format(snapshot.data?.newRecovered);
                var totalRecovered = new NumberFormat("#,###")
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
                          icon: Icons.healing,
                          value: newConfirmed.toString(),
                          label: "New Confirmed",
                          color: Colors.lightBlue,
                        ),
                        SummaryCardWidget(
                          icon: Icons.healing,
                          value: totalConfirmed.toString(),
                          label: "Total Confirmed",
                          color: Colors.lightBlue,
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SummaryCardWidget(
                          icon: Icons.post_add_sharp,
                          value: newDeaths.toString(),
                          label: "New Deaths",
                          color: Colors.redAccent,
                        ),
                        SummaryCardWidget(
                          icon: Icons.post_add_sharp,
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
                          icon: Icons.check,
                          value: newRecovered.toString(),
                          label: "New Recovered",
                          color: Colors.teal,
                        ),
                        SummaryCardWidget(
                          icon: Icons.check,
                          value: totalRecovered.toString(),
                          label: "Total Recovered",
                          color: Colors.teal,
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
