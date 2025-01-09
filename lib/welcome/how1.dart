import 'package:flutter/material.dart';
import 'package:gamecatalog/welcome/how2.dart';
import 'package:gamecatalog/menu/mainmenu.dart';

class How1 extends StatelessWidget {
  final int? id;
  const How1({
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
                      '1',
                      style: TextStyle(
                        color: Color(0xFF1E90B5),
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '/2',
                      style: TextStyle(
                        color: Color(0xFF8D92A3),
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
                              builder: (context) => Mainmenu(
                                    id: id,
                                  )));
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
                'images/Vector/how1.png',
              ),
            ),
            Center(
              child: Text(
                'Explore Games',
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
                'Explore the games that are currently popular                         or latest and discover various interesting                          articles.',
                style: TextStyle(
                  color: Color(0xFF8D92A3),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => How2(id: id)));
                    },
                    child: Text(
                      'Next',
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
