import 'package:flutter/material.dart';
import 'package:global_coronavirus_info/models/summary.dart';
import 'package:global_coronavirus_info/services/services.dart';
import 'package:global_coronavirus_info/widgets/SummaryCardWidget.dart';

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
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.blue[200],
        //child: Text("holaaaaa"),
        child: FutureBuilder<Summary>(
            future: _summaryList,
            builder: (context, AsyncSnapshot<Summary> snapshot) {
              if (snapshot.hasData) {
                var newConfirmed = snapshot.data?.newConfirmed;
                var totalConfirmed = snapshot.data?.totalConfirmed;
                var newDeaths = snapshot.data?.newDeaths;
                var totalDeaths = snapshot.data?.totalDeaths;
                var newRecovered = snapshot.data?.newRecovered;
                var totalRecovered = snapshot.data?.totalRecovered;
                var date = snapshot.data?.date;

                return Column(
                  children: [
                    SummaryCardWidget(
                        icon: Icons.laptop_mac,
                        value: newConfirmed.toString(),
                        label: "New Confirmed: "),
                    SummaryCardWidget(
                        icon: Icons.laptop_mac,
                        value: totalConfirmed.toString(),
                        label: "Total Confirmed:"),
                    SummaryCardWidget(
                        icon: Icons.laptop_mac,
                        value: newDeaths.toString(),
                        label: "New Deaths: "),
                    SummaryCardWidget(
                        icon: Icons.laptop_mac,
                        value: totalDeaths.toString(),
                        label: "Total Deaths: "),
                    SummaryCardWidget(
                        icon: Icons.laptop_mac,
                        value: newRecovered.toString(),
                        label: "New Recovered: "),
                    SummaryCardWidget(
                        icon: Icons.laptop_mac,
                        value: totalRecovered.toString(),
                        label: "Total Recovered: "),
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
