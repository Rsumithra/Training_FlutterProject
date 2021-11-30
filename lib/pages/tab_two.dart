import 'package:create_watchlist_flutter/models/contacts.dart';

import 'package:flutter/material.dart';
import '../repository/contactsrespository.dart';

class Contacttwo extends StatefulWidget {
  const Contacttwo({Key? key}) : super(key: key);

  @override
  State<Contacttwo> createState() => _ContacttwoState();
}

class _ContacttwoState extends State<Contacttwo> {
  List<Contacts> _contacts = [];
  List<Contacts> secondset = [];
  ContactsRespository contval = ContactsRespository();
  @override
  void initState() {
    super.initState();
    contval.getContacts().then((contacts) {
      setState(() {
        _contacts = contacts;
        secondset = _contacts.sublist(25, 50);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contacts.isEmpty
          ? const Center(child: CircularProgressIndicator.adaptive())
          : ListView.builder(
              itemCount: secondset.length,
              itemBuilder: (context, index) {
                Contacts con = secondset[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: ListTile(
                    title: Text(con.name),
                    subtitle: Text(con.contacts),
                    trailing: Image.network("https://picsum.photos/200/300"),
                  ),
                );
              }),
    );
  }
}
