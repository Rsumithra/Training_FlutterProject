import 'package:create_watchlist_flutter/pages/contacts_list.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:create_watchlist_flutter/models/contacts.dart';

import 'package:create_watchlist_flutter/constants/constants.dart';

import '../repository/contactsrespository.dart';

class TabPage extends StatefulWidget {
  const TabPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  ContactsRespository contval = ContactsRespository();
  List<Contacts> _contacts = [];
  List<Contacts> groupone = [];
  List<Contacts> grouptwo = [];
  List<Contacts> groupthree = [];
  List<Contacts> groupfour = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      getcontactdata();
    });
  }

  void getcontactdata() {
    contval.getContacts().then((contacts) {
      setState(() {
        _contacts = contacts;
        groupone = _contacts.sublist(0, 25);
        grouptwo = _contacts.sublist(25, 50);
        groupthree = _contacts.sublist(50, 75);
        groupfour = _contacts.sublist(75, 100);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.apptitle),
          bottom: TabBar(
            tabs: [
              for (int i = 1; i <= 4; i++) Tab(text: Constants.tabname + '$i')
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ContactList(listofContacts: groupone),
            ContactList(listofContacts: grouptwo),
            ContactList(listofContacts: groupthree),
            ContactList(listofContacts: groupfour)
          ],
        ),
      ),
      length: 4,
      initialIndex: 0,
    );
  }
}
