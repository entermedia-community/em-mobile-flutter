import 'package:em_mobile_flutter/NavMenu.dart';
import 'package:em_mobile_flutter/emlogo.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
          //appbar title & menu goes here
          title: NavMenu(),
          pinned: true,
          expandedHeight: 180.0,
          //logo goes here?
          flexibleSpace: FlexibleSpaceBar(
            background: EmLogo(),
          )),
      SliverList(
        delegate: SliverChildListDelegate(<Widget>[
          emWorkspace('asset/alfredlogo.jpg', 'Alfred Music', 'www.test.com'),
          emWorkspace('asset/cbclogo.jpg', 'Canadian Broadcasting Corp.', 'www.test.com'),
          emWorkspace('asset/harvardlogo.jpg', 'Harvard University', 'www.test.com'),
          emWorkspace('asset/unlogo.jpg', 'United Nations', 'www.test.com'),
          emWorkspace('asset/yalelogo.jpg', 'Yale University', 'www.test.com'),
        ]),
      )
    ]));
  }
}
//Custom workspace row layout
Widget emWorkspace(
    String imageVal, String workspaceName, String collectionURL) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x8092e184),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: emWorkspaceRow(
          imageVal,
          workspaceName,
          collectionURL,
        ),
      ),
    ),
  );
}

Center emWorkspaceRow(
    String imageVal, String workspaceName, String collectionURL) {
  return Center(
      child: Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          left(imageVal, workspaceName),
          right(collectionURL),
        ],
      )
    ],
  ));
}

Widget left(String imageVal, String workspaceName) {
  return Container(
      child: Row(
    children: <Widget>[
      //TODO Change AssetImage to NetworkImage('URL')
      Container(
        child: Image(
          height: 50.0,
          image: AssetImage(imageVal),
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      Container(
        child: Text(
          workspaceName,
          style: TextStyle(
              color: Color(0xff000015),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
        ),
      ),
    ],
  ));
}

Widget right(String collectionURL) {
  return Container(
      child: Column(
    children: <Widget>[
      Container(
        child: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            //TODO: This button will open to collection Webview
          },
        ),
      ),
    ],
  ));
}
