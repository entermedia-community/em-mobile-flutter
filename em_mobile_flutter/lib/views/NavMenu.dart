import 'package:em_mobile_flutter/models/emUser.dart';
import 'package:em_mobile_flutter/models/userData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:em_mobile_flutter/services/authentication.dart';
import 'package:provider/provider.dart';


class NavMenu extends StatelessWidget {

  const NavMenu();

  @override
  Widget build(BuildContext context) {
    final myUser = Provider.of<userData>(context, listen : false);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.apps_rounded,
            ),
          ),
          ),
          Container(child: Padding(
            padding: const EdgeInsets.all(16.0),
            //testing Consumer class to see if provider is able to grab the correct information.
              //working as of Oct 16th 2020 - mando
            child: Consumer<userData>(
              builder: (context,myUser,child) => Text(
                  '${myUser.screenname}'
              ),
            )
          ),
          ),
          Container(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },

            ),
          ),
          )
        ],
      )
    );
  }
}
