import 'dart:convert';
import 'package:flutter/material.dart';
import '/Contacts.dart';
import 'package:http/http.dart';

class Contactone extends StatefulWidget {
  const Contactone({Key? key}) : super(key: key);

  @override
  State<Contactone> createState() => _ContactoneState();
}

class _ContactoneState extends State<Contactone> {
  List<Contacts> contacts = [];
  List<Contacts> firstset = [];
  //final url = "https://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts";

  Future<List<Contacts>> getContacts() async {
    String url = "https://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts";

    try {
      final response = await get(Uri.parse(url));
      if (200 == response.statusCode) {
        this.setState(() {
          contacts = contactsFromJson(response.body);
          debugPrint(response.body);
          //  contacts.forEach((element) => print(element));
          for (int i = 0; i < 25; i++) {
            firstset.add(contacts[i]);
          }
        });

        return firstset;
      } else {}
    } catch (e) {}
    return firstset;
  }

  @override
  void initState() {
    getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView.builder(
              itemCount: firstset.length,
              itemBuilder: (context, index) {
                Contacts con = firstset[index];
                return ListTile(
                  title: Text(con.name),
                  subtitle: Text(con.contacts),
                  trailing: Image.network("https://picsum.photos/200/300"),
                );
              })),
    );
  }
}
