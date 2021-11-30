import 'package:create_watchlist_flutter/constants/constants.dart';
import 'package:create_watchlist_flutter/pages/tab_four.dart';
import 'package:create_watchlist_flutter/pages/tab_one.dart';
import 'package:create_watchlist_flutter/pages/tab_three.dart';
import 'package:create_watchlist_flutter/pages/tab_two.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Myapp());

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contact App'),
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.black26,
            tabs: [
              Tab(text: Constants.tab_name + "1"),
              Tab(text: Constants.tab_name + "2"),
              Tab(
                text: Constants.tab_name + "3",
              ),
              Tab(text: Constants.tab_name + "4")
            ],
          ),
        ),
        body: const TabBarView(
          children: [Contactone(), Contacttwo(), Contactthree(), ContactFour()],
        ),
      ),
      length: 4,
      initialIndex: 0,
    ));
  }
}
