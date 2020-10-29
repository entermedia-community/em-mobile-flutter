import 'package:em_mobile_flutter/models/emWorkspaces.dart';
import 'package:em_mobile_flutter/models/userData.dart';
import 'package:em_mobile_flutter/services/entermedia.dart';
import 'package:em_mobile_flutter/views/NavMenu.dart';
import 'package:em_mobile_flutter/views/NavRail.dart';
import 'package:em_mobile_flutter/models/emLogo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'EMWebview.dart' as Col;
import 'package:webview_flutter/webview_flutter.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

//todo; LAYOUT starts here
class _HomeMenuState extends State<HomeMenu> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final EM = Provider.of<EnterMedia>(context);
    return Scaffold(
      floatingActionButton: Consumer<userData>(
        builder: (context, myUser, child) => FloatingActionButton(
          onPressed: () async {
            final EmWorkspaces userWorkspaces = await EM.getEMWorkspaces();
            print(userWorkspaces.results);
          },
          child: Icon(Icons.refresh),
        ),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            extended: false,
            minWidth: 56,
            backgroundColor: Color(0xff0c223a),
            unselectedIconTheme: IconThemeData(color: Colors.white),
            selectedIconTheme: IconThemeData(color: Color(0xff61af56)),
            elevation: 10,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home_rounded),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                  icon: Icon(Icons.chat_bubble_rounded), label: Text('Chat')),
              NavigationRailDestination(
                  icon: Icon(Icons.filter_alt_rounded), label: Text('Search')),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                  //appbar title & menu goes here
                  title: NavMenu(),
                  pinned: true,
                  expandedHeight: 100.0,
                  //logo goes here?
                  flexibleSpace: FlexibleSpaceBar(
                    background: EmLogo(),
                  )),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                        (ctx, i) => Image.asset(
                      example[i],
                    ),
                    childCount: example.length),
              ),
            ]),
          )
        ],
      ),
    );
  }


}
// todo; Load image url into list dynamically from entermedia.
final List<String> images = [
  "https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1538688525198-9b88f6f53126?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
  "https://images.unsplash.com/photo-1513161455079-7dc1de15ef3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  "https://images.unsplash.com/photo-1544457070-4cd773b4d71e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=843&q=80",
  "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  "https://images.unsplash.com/photo-1549488344-cbb6c34cf08b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
];

final List<String> example = [
  'assets/images/one.jpg',
  'assets/images/two.jpg',
  'assets/images/three.jpg',
  'assets/images/four.jpg',
  'assets/images/five.jpg',
  'assets/images/six.jpg',

];


