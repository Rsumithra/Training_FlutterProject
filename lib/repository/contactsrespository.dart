import 'package:create_watchlist_flutter/constants/constants.dart';
import 'package:create_watchlist_flutter/models/contacts.dart';
import '../networking/api_call.dart';

class ContactsRespository {
  final Apicall _provider = Apicall();

  Future<List<Contacts>> getContacts() async {
    List<Contacts> contacts = [];
    try {
      final response = await _provider.get(Constants.contactsurl);
      contacts = contactsFromJson(response);
      return contacts;
    } catch (exception) {
      return contacts;
    }
  }
}
