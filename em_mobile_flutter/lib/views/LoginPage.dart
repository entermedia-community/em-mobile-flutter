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
    // todo; Calling the global class of userData() and naming it myUser for all widgets nested in it. this will pretty much always happen at under 'Widget build(BuildContext context) {...' -> ln 58, of this file.
    final myUser = Provider.of<userData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('EnterMediaDB Mobile'),
        centerTitle: true,
      ),

      body: Container(
        //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 130.0),
        //margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 130.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text("Login:", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0, color: Colors.indigo)),
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
                // todo; Here we call and update global myUser class with Entermedia user information after logging in.-> ln 31 NavMenu.dart
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
        )

      ),
    );
  }
}
