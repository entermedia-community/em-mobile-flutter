import 'package:em_mobile_flutter/models/emUser.dart';
import 'package:http/http.dart' as http;

class EnterMedia {
  final String EM = 'https://entermediadb.org/entermediadb/app';
  final String MEDIADB = 'https://entermediadb.org/entermediadb/mediadb';

  Future<EMUser> getEMKey(String email, String password) async {
    final response = await http.post(
        MEDIADB + '/services/authentication/firebaselogin.json',
        body: {
          "email": email,
          "password": password
        }

    );

    if (response.statusCode == 201) {
      print(response.body);
      final String responseString = response.body;
      return emUserFromJson(responseString);
    } else {
      print(response);
      return null;
    }
  }


}
