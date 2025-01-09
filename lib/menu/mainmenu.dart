import 'package:flutter/material.dart';
import 'package:gamecatalog/menu/gamelist.dart';
import 'package:gamecatalog/menu/homepage.dart';
import 'package:gamecatalog/menu/profile.dart';
import 'package:gamecatalog/menu/promo.dart';
import 'package:gamecatalog/menu/news.dart';

class Mainmenu extends StatefulWidget {
  final int? id;
  final int selectedIndex;
  const Mainmenu({super.key, this.id, this.selectedIndex = 0});

  @override
  State<Mainmenu> createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      Homepage(),
      GameList(),
      Promo(),
      NewsPage(),
      ProfilePage(id: widget.id),
    ];

    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Color(0xFF15244D),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.new_releases),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF1E90B5),
          unselectedItemColor: Color(0xFF8D92A3),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
