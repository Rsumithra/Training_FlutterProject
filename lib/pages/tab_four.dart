import 'package:create_watchlist_flutter/models/contacts.dart';

import 'package:flutter/material.dart';
import '../repository/contactsrespository.dart';

class ContactFour extends StatefulWidget {
  const ContactFour({Key? key}) : super(key: key);

  @override
  State<ContactFour> createState() => _ContactFourState();
}

class _ContactFourState extends State<ContactFour> {
  List<Contacts> _contacts = [];
  List<Contacts> fourthset = [];
  ContactsRespository contval = ContactsRespository();
  @override
  void initState() {
    super.initState();
    contval.getContacts().then((contacts) {
      setState(() {
        _contacts = contacts;
        fourthset = _contacts.sublist(75, 100);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contacts.isEmpty
          ? const Center(child: CircularProgressIndicator.adaptive())
          : ListView.builder(
              itemCount: fourthset.length,
              itemBuilder: (context, index) {
                Contacts con = fourthset[index];
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
