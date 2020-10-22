import 'package:em_mobile_flutter/models/emUser.dart';
import 'package:em_mobile_flutter/models/emWorkspaces.dart';
import 'package:em_mobile_flutter/models/workspaceObject.dart' as obj;
import 'package:http/http.dart' as http;

class EnterMedia {
  final String EM = 'https://entermediadb.org/entermediadb/app';
  final String MEDIADB = 'https://entermediadb.org/entermediadb/mediadb';

  //This gets the Entermedia user information called when logging in. - Mando Oct 14th 2020
  Future<EmUser> getEMKey(String email, String password) async {
    final response = await http.post(
        MEDIADB + '/services/authentication/firebaselogin.json',
        body: {"email": email, "password": password});
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
  Future<EmWorkspaces> getEMWorkspaces(String userid, String emkey) async {
//    final terms = obj.Term(field: "id",termOperator: "matches",value: "*");
//    final query = obj.Query(terms: obj.Term(field: "id",termOperator: "matches",value: "*"));
//    final workspace = obj.Workspace(hitsperpage: "1",page: "100",query: query);

    final response = await http.post(
      MEDIADB + '/services/module/librarycollection/viewprojects.json',
      body: {
        "userid": userid,
      },
      headers: {'entermedia.key': emkey},
    );
    print("Fetching workspaces. Response code number below.");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Success user WORKSPACES are:" + response.body);
      final String responseString = response.body;

      return emWorkspacesFromJson(responseString);
    } else {
      print("Request failed!" + response.body);
      return null;
    }
  }
}
