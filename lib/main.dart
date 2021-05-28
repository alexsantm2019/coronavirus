import 'package:flutter/material.dart';
import 'package:global_coronavirus_info/widgets/SummaryWidget.dart';
import 'package:global_coronavirus_info/widgets/CountriesWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Coronavirus in the world'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Summary', icon: Icon(Icons.person)),
                Tab(text: 'Countries', icon: Icon(Icons.map)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SummaryWidget(),
              CountriesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
