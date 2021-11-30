import 'package:create_watchlist_flutter/models/contacts.dart';
import 'package:create_watchlist_flutter/constants/constants.dart';
import 'package:flutter/material.dart';
import '../repository/contactsrespository.dart';

class Contactone extends StatefulWidget {
  const Contactone({Key? key}) : super(key: key);

  @override
  State<Contactone> createState() => _ContactoneState();
}

class _ContactoneState extends State<Contactone> {
  List<Contacts> _contacts = [];
  List<Contacts> firstset = [];
  ContactsRespository contval = ContactsRespository();
  @override
  void initState() {
    super.initState();
    contval.getContacts().then((contacts) {
      setState(() {
        _contacts = contacts;
        firstset = _contacts.sublist(0, 25);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contacts.isEmpty
          ? const Center(child: CircularProgressIndicator.adaptive())
          : ListView.builder(
              itemCount: firstset.length,
              itemBuilder: (context, index) {
                Contacts con = firstset[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: ListTile(
                    title: Text(con.name),
                    subtitle: Text(con.contacts),
                    trailing: Image.network(Constants.img_url),
                  ),
                );
              }),
    );
  }
}
