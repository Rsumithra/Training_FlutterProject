import 'package:create_watchlist_flutter/constants/constants.dart';
import 'package:create_watchlist_flutter/models/contacts.dart';
import '../networking/api_call.dart';

class ContactsRespository {
  final Api_call _provider = Api_call();

  Future<List<Contacts>> getContacts() async {
    List<Contacts> contacts = [];
    try {
      final response = await _provider.get(Constants.contacts_url);
      contacts = contactsFromJson(response);
      return contacts;
    } catch (Exception) {
      return contacts;
    }
  }
}
