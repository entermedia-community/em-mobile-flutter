import 'package:em_mobile_flutter/models/userWorkspaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class workspaceIcon extends StatefulWidget {
  @override
  _workspaceIconState createState() => _workspaceIconState();
}

class _workspaceIconState extends State<workspaceIcon> {
  //example List
  List<String> choices = ["uno", "dos", "tres"];
  @override
  Widget build(BuildContext context) {
    return Consumer<userWorkspaces>(
      builder: (context, myWorkspaces, child) => PopupMenuButton(
        icon: Icon(Icons.account_tree_rounded),
        elevation: 15,
        itemBuilder: (BuildContext context) {
          return myWorkspaces.names.map((name) {
            return PopupMenuItem(value: name, child: Text(name));
          }).toList();
        },
        onSelected: (choice) => choiceAction(choice),
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == choices[0]) {
      print(choices[0]);
    } else if (choice == choices[1]) {
      print(choices[1]);
    } else if (choice == choices[2]) {
      print(choices[2]);
    }
  }
}
