import 'package:em_mobile_flutter/models/emWorkspaces.dart';
import 'package:em_mobile_flutter/models/userData.dart';
import 'package:em_mobile_flutter/services/entermedia.dart';
import 'package:em_mobile_flutter/views/NavMenu.dart';
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
  @override
  Widget build(BuildContext context) {
    final EM = Provider.of<EnterMedia>(context);
    return Scaffold(
      floatingActionButton: Consumer<userData>(
        builder: (context,myUser,child) => FloatingActionButton(
          onPressed: () async {
            final EmWorkspaces userWorkspaces = await EM.getEMWorkspaces();
            print(userWorkspaces.results);
          },
          child: Icon(Icons.refresh),
        ),
      ),
        body:
        CustomScrollView(slivers: <Widget>[
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
        //TODO add forEach type method upon receiving Collection Data
        delegate: SliverChildListDelegate(<Widget>[
          emWorkspace('assets/alfredlogo.jpg', 'Alfred Music', 'https://entermediadb.org/app/collective/community/index.html?collectionid=AWbFzET9zBh81y9Kc8l2&goaltrackerstaff=*'),
          emWorkspace('assets/cbclogo.jpg', 'Canadian Broadcasting Corp.',
              'www.test.com'),
          emWorkspace(
              'assets/harvardlogo.jpg', 'Harvard University', 'https://www.entermediadb.org'),
          emWorkspace('assets/unlogo.jpg', 'United Nations', 'www.entermediadb.org'),
          emWorkspace('assets/yalelogo.jpg', 'Yale University', 'www.entermediadb.org'),
          emWorkspace('assets/alfredlogo.jpg', 'Alfred Music', 'www.entermediadb.org'),
          emWorkspace('assets/cbclogo.jpg', 'Canadian Broadcasting Corp.',
              'www.test.com'),
          emWorkspace(
              'assets/harvardlogo.jpg', 'Harvard University', 'www.entermediadb.org'),
          emWorkspace('assets/unlogo.jpg', 'United Nations', 'www.entermediadb.org'),
          emWorkspace('assets/yalelogo.jpg', 'Yale University', 'www.entermediadb.org'),
        ]),
      )
    ]),

    );
  }
}

//todo: Custom workspace row layout, and extra functions-Mando
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
          // Create an inner BuildContext so that the onPressed methods
          // can refer to the Scaffold with Scaffold.of(). CANNOT USE BuildContext from original scaffolding.-Mando
          child: Builder(builder: (BuildContext context) {
            return emWorkspaceRow(
                imageVal, workspaceName, collectionURL, context);
          })),
    ),
  );
}

Center emWorkspaceRow(String imageVal, String workspaceName,
    String collectionURL, BuildContext context) {
  return Center(
      child: Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          leftSide(imageVal, workspaceName),
          rightSide(collectionURL, context),
        ],
      )
    ],
  ));
}

Widget leftSide(String imageVal, String workspaceName) {
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
              fontWeight: FontWeight.w300,
              fontSize: 16.0),
        ),
      ),
    ],
  ));
}

Widget rightSide(String collectionURL, BuildContext context) {
  return Container(
      child: Column(
    children: <Widget>[
      Container(
        child: IconButton(
          icon: Icon(Icons.web),
          onPressed: () {
            _openCollectionWV(context, collectionURL);
            //TODO: This button will open to collection Webview
            final snackBar = SnackBar(
              content: Text('No Webview Attached'),
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {

                },
              ),
            );

            // Find the Scaffold in the widget tree and use
            // it to show a SnackBar.
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    ],
  ));
}
void _openCollectionWV(BuildContext context, String url) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => Col.WebViewContainer(url)));
}
