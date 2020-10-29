import 'package:flutter/material.dart';

class NavRail extends StatefulWidget {
  @override
  _NavRailState createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Color(0xff0c223a),
            elevation: 10,
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home_rounded), label: Text('Home')),
              NavigationRailDestination(icon: Icon(Icons.chat_bubble_rounded), label: Text('Chat')),
              NavigationRailDestination(icon: Icon(Icons.filter_alt_rounded), label: Text('Search')),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),

        ],
      ),
    );
  }
}
