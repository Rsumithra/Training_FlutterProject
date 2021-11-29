import 'dart:convert';

import 'package:create_watchlist_flutter/models/contacts.dart';
import '../networking/api_call.dart';
import 'package:flutter/material.dart';
import '../repository/contactsrespository.dart';

class Contactone extends StatefulWidget {
  const Contactone({Key? key}) : super(key: key);

  @override
  State<Contactone> createState() => _ContactoneState();
}

class _ContactoneState extends State<Contactone> {
  List<Contacts> _contacts = [];
  ContactsRespository contval = ContactsRespository();
  @override
  void initState() {
    super.initState();
    contval.getContacts().then((contacts) {
      setState(() {
        _contacts = contacts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contacts.isEmpty
          ? Center(child: Text("No data Available"))
          : Container(
              child: ListView.builder(
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    Contacts con = _contacts[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: ListTile(
                        title: Text(con.name),
                        subtitle: Text(con.contacts),
                        trailing:
                            Image.network("https://picsum.photos/200/300"),
                      ),
                    );
                  })),
    );
  }
}
