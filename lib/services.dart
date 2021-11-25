import 'package:http/http.dart';
import 'Contacts.dart';

class Services {
  static const String url =
      "https://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts";

  static Future<List<Contacts>> getContacts() async {
    late List<Contacts> contacts;
    try {
      final response = await get(Uri.parse(url));
      if (200 == response.statusCode) {
        contacts = contactsFromJson(response.body);
        return contacts;
      } else {}
    } catch (e) {}
    return contacts;
  }
}
