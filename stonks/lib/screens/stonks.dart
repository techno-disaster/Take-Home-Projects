import 'dart:async';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:stonks/screens/home_screen.dart';

class Stonks extends StatefulWidget {
  @override
  _StonksState createState() => _StonksState();
}

class _StonksState extends State<Stonks> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Index 1: Chat',
    ),
    Text(
      'Index 2: Mention',
    ),
    Text(
      'Index 3: Browse',
    ),
  ];
  static List<Widget> _appBarWidgets = <Widget>[
    Text(
      "Welcome back, User 👋 ",
      style: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic, color: Colors.black),
    ),
    RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "\$745034",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(
            text: ".35",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),
          )
        ],
      ),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        int removeIndex = 0;
        AnimatedListRemovedItemBuilder builder = (context, animation) {
          return _buildItem(_appBarWidgets.removeAt(removeIndex), animation);
        };
        _listKey.currentState.removeItem(removeIndex, builder);
      },
    );
  }

  Widget _buildItem(Widget _item, Animation _animation) {
    return SizeTransition(
      sizeFactor: _animation,
      child: _item,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Column(
            children: [
              AnimatedList(
                shrinkWrap: true,
                key: _listKey,
                initialItemCount: _appBarWidgets.length,
                itemBuilder: (context, index, animation) =>
                    _buildItem(_appBarWidgets[index], animation),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                badgeColor: Theme.of(context).primaryColor,
                badgeContent: Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.alternate_email),
              ),
              label: 'Mentions',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(
                    Icons.search,
                  ),
                ],
              ),
              label: 'Browse',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
