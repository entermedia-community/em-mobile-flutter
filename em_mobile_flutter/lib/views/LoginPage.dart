import 'package:em_mobile_flutter/models/emUser.dart';
import 'package:em_mobile_flutter/models/userData.dart';
import 'package:em_mobile_flutter/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:em_mobile_flutter/services/entermedia.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final EnterMedia EM = EnterMedia();

  @override
  Widget build(BuildContext context) {
    final myUser = Provider.of<userData>(context);
    // TODO: Lando begin styling below here, thnx - mando

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "email",
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "password",
            ),
          ),
          RaisedButton(
            onPressed: () async {
              String email = emailController.text.trim();
              String password = passwordController.text.trim();
              //Get User info from entermedia website
              final EmUser userInfo = await EM.getEMKey(email, password);
              print(userInfo.results.screenname);
              //update global Provider of myUser class with Entermedia User information - mando
              myUser.addUser(
                  userInfo.results.userid,
                  userInfo.results.screenname,
                  userInfo.results.entermediakey,
                  userInfo.results.firstname,
                  userInfo.results.lastname,
                  userInfo.results.email,
                  userInfo.results.firebasepassword);

              //ToDo add loading spinner?

              //Firebase Authentication
              context.read<AuthenticationService>().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim());
            },
            child: Text("Sign In"),
          )
        ],
      ),
    );
  }
}
