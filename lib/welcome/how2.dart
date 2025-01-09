import 'package:flutter/material.dart';
import 'package:gamecatalog/welcome/how1.dart';
import 'package:gamecatalog/menu/mainmenu.dart';

class How2 extends StatelessWidget {
  final int? id;
  const How2({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF15244D),
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '2',
                      style: TextStyle(
                        color: Color(0xFF1E90B5),
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '/2',
                      style: TextStyle(
                        color: Color(0xFF1E90B5),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mainmenu(id: id)));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF1E90B5),
                        fontSize: 18,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset(
                'images/Vector/how2.png',
              ),
            ),
            Center(
              child: Text(
                'Discover Promo and Events',
                style: TextStyle(
                  color: Color(0xFF1E90B5),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Discover various ongoing events with                           exciting promotions.',
                style: TextStyle(
                  color: Color(0xFF8D92A3),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => How1(id: id)));
                    },
                    child: Text(
                      'Prev',
                      style: TextStyle(
                        color: Color(0xFF8D92A3),
                        fontSize: 18,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mainmenu(
                                    id: id,
                                  )));
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Color(0xFF1E90B5),
                        fontSize: 18,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
