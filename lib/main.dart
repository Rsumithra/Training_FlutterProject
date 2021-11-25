import 'package:create_watchlist_flutter/contacts/contactfour.dart';
import 'package:create_watchlist_flutter/contacts/contactone.dart';
import 'package:create_watchlist_flutter/contacts/contactthree.dart';
import 'package:create_watchlist_flutter/contacts/contacttwo.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

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
          title: Text('Contact App'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Contact1"),
              Tab(text: "Contact2"),
              Tab(
                text: 'Contact3',
              ),
              Tab(
                text: "Contact4",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [Contactone(), Contacttwo(), Contactthree(), ContactFour()],
        ),
      ),
      length: 4,
      initialIndex: 0,
    ));
  }
}
