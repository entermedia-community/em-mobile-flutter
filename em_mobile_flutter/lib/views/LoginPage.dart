import 'package:em_mobile_flutter/models/emUser.dart';
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

  EMUser _user;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              final EMUser userInfo = await EM.getEMKey(email, password);

              setState(() {
                _user = userInfo;
              });

              context.read<AuthenticationService>().signIn(
                email: emailController.text.trim(),
                password: passwordController.text.trim()
              );
            },
            child: Text("Sign In"),
          )
        ],
      ),
    );
  }
}