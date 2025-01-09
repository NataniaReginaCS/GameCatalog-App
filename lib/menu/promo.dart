import 'package:flutter/material.dart';

class Promo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: Container(
            padding: EdgeInsets.all(10),
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
            child: AppBar(
              actions: [
                Image.asset(
                  'images/Vector/icon_GameKatalog_home.png',
                  height: 80,
                  width: 80,
                ),
              ],
              backgroundColor: Color(0xFF15244D),
              elevation: 0,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Game Promo',
                    style: TextStyle(
                      color: Color(0xFF1E90B5),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Let’s Explore Offers',
                    style: TextStyle(
                      color: Color(0xFF8D92A3),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xFF182641),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 35.0, left: 13.0, right: 13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 25.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset('images/Promo/promo1.jpg'))),
                Container(
                    margin: EdgeInsets.only(bottom: 25.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset('images/Promo/promo2.jpg'))),
                Container(
                    margin: EdgeInsets.only(bottom: 25.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset('images/Promo/promo3.jpg'))),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
