import 'package:em_mobile_flutter/models/emUser.dart';
import 'package:em_mobile_flutter/models/emWorkspaces.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnterMedia {
  final String EM = 'https://entermediadb.org/entermediadb/app';
  final String MEDIADB = 'https://entermediadb.org/entermediadb/mediadb';

  //This gets the Entermedia user information called when logging in. - Mando Oct 14th 2020
  Future<EmUser> getEMKey(String email, String password) async {
    final response = await http.post(
        MEDIADB + '/services/authentication/firebaselogin.json',
        body: {
          "email": email,
          "password": password
        }

    );
    print("Post started response is below!");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Success user info is:" + response.body);
      final String responseString = response.body;


      return emUserFromJson(responseString);
    } else {
      return null;
    }
  }
//This function retrieves list of workspaces the user is apart of.
  Future<EmWorkspaces> getEMWorkspaces(String email, String password) async {
    final response = await http.post(
        MEDIADB + '/services/module/librarycollection/viewprojects.json',
        body: {
          "email": email,
          "password": password
        }

    );
    print("Fetching workspaces.");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Success user WORKSPACES are:" + response.body);
      final String responseString = response.body;


      return emWorkspacesFromJson(responseString);
    } else {
      return null;
    }
  }


}
