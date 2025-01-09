import 'package:flutter/material.dart';
import 'package:gamecatalog/entity/news.dart';
import 'package:gamecatalog/content/detailnews.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

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
            ),
          ),
        ),
        backgroundColor: Color(0xFF182641),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CarouselView(
                  onTap: (int index) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailnews(news: news[index]),
                      ),
                    );
                  },
                  itemExtent: MediaQuery.of(context).size.width * 0.9,
                  shape: LinearBorder(),
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemSnapping: true,
                  children: news.map((path) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(path.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Game News',
                  style: TextStyle(
                    color: Color(0xFF1E90B5),
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            Expanded(
              child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 20, left: 5, right: 0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          news[index].image,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 50,
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              news[index].name,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF1E90B5),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.newspaper_outlined,
                                  color: Color(0xFF8D92A3),
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    news[index].source,
                                    style: TextStyle(
                                      color: Color(0xFF8D92A3),
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detailnews(news: news[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20)
          ],
        ));
  }
}
