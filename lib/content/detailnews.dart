import 'package:flutter/material.dart';
import 'package:gamecatalog/entity/news.dart';

class Detailnews extends StatelessWidget {
  final News news;

  const Detailnews({Key? key, required this.news}) : super(key: key);

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
                  'Game News',
                  style: TextStyle(
                    color: Color(0xFF1E90B5),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Let’s Explore News',
                  style: TextStyle(
                    color: Color(0xFF8D92A3),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                color: Color(0xFF1E90B5),
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF182641),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  news.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 18, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.name,
                    style: TextStyle(
                      color: Color(0xFF1E90B5),
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    news.description,
                    style: TextStyle(
                      color: Color(0xFF8D92A3),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Text(
                        'Source: ',
                        style: TextStyle(
                          color: Color(0xFF8D92A3),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        news.source,
                        style: TextStyle(
                          color: Color(0xFF8D92A3),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
