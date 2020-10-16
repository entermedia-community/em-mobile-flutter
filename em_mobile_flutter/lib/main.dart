import 'package:em_mobile_flutter/models/emUser.dart';
import 'package:em_mobile_flutter/models/userData.dart';
import 'package:em_mobile_flutter/views/HomeMenu.dart';
import 'package:em_mobile_flutter/views/LoginPage.dart';
import 'package:em_mobile_flutter/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //a way to set the glue between the widgets and the Flutter engine before it has been done itself. This happens automatically a bit after the main method is called.
  //but as we want to initialize a class asynchronously then, before that is done we need to say:  "Hey, can we do the initialization now and after that we initialize the class"
  //binding is required before/inorder to call native code. - 10/2/2020
  await Firebase.initializeApp();
  //initialize firebase.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<userData>(create: (context) => userData()),
          Provider<AuthenticationService>(
              create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthenticationService>().authStateChanges,
          ),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EntermediaDB Demo',
        //Entermedia Theme Colors
        theme: ThemeData(
          primaryColor: Color(0xff0c223a),
          accentColor: Color(0xff61af56),
          backgroundColor: Colors.white38,
          //Text Colors
          textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Color(0xff92e184))
          ),
          //Button Colors
          buttonTheme: ButtonThemeData(
            buttonColor: Color(0xff61af56),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

//Requires users to be logged into Firebase
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null){
      return HomeMenu();
    }

    return LoginPage();
  }
}


