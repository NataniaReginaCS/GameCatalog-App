import 'package:flutter/material.dart';
import 'package:gamecatalog/welcome/how1.dart';

class Welcome extends StatelessWidget {
  final int? id;
  const Welcome({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Vector/wallpaper_gameCatalog.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(0, 0, 0, 0).withOpacity(0),
                    Color.fromARGB(0, 0, 0, 0).withOpacity(0.73),
                  ],
                  stops: [0.1, 0.4],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.sizeOf(context).height * 0.22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Explore Games,               here you go',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.sizeOf(context).height * 0.035),
                  child: Text(
                    'Lets explore popular games that are loved!',
                    style: TextStyle(
                      color: Color(0xFFF2F2F2),
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.sizeOf(context).height * 0.1),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF224C8F), Color(0xFF22D1EE)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => How1(id: id)));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.only(left: 100, right: 100)),
                    child: Text('Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
