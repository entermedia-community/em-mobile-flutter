import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:em_mobile_flutter/services/authentication.dart';
import 'package:provider/provider.dart';


class NavMenu extends StatelessWidget {

  const NavMenu();

  @override
  Widget build(BuildContext context) {
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
            child: Text(
              ''
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
