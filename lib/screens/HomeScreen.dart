import 'package:flutter/material.dart';
import 'package:global_coronavirus_info/widgets/SummaryWidget.dart';
import 'package:global_coronavirus_info/widgets/CountriesWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Coronavirus in the world'))
              ],
            ),
            backgroundColor: Colors.indigo[900],
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(text: 'Summary', icon: Icon(Icons.text_snippet)),
                Tab(text: 'Countries', icon: Icon(Icons.map_sharp)),
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
