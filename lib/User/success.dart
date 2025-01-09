import 'package:flutter/material.dart';
import 'package:gamecatalog/welcome/welcome.dart';

class Success extends StatelessWidget {
  final int? id;
  const Success({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF15244D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Image.asset(
                'images/Vector/succes.png',
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 60),
                child: Text('Yeay! Completed',
                    style: TextStyle(color: Color(0xFF1E90B5), fontSize: 20))),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Now, you can explore a variety of games.',
                    style: TextStyle(color: Color(0xFF8D92A3), fontSize: 14))),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.06,
              margin: EdgeInsets.only(top: 60),
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Welcome(id: id)));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.only(left: 130, right: 130)),
                child: Text('Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
