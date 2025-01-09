import 'package:flutter/material.dart';
import 'package:gamecatalog/entity/game.dart';
import 'package:gamecatalog/content/detailgame.dart';

List<String> events = [
  ('images/Events/events_1.jpg'),
  ('images/Events/events_2.jpg'),
  ('images/Events/events_3.jpg'),
];

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final searchGame = games.where((item) {
      final isSearchMatch =
          item.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return isSearchMatch;
    }).toList();

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
                  'GameCatalog',
                  style: TextStyle(
                    color: Color(0xFF1E90B5),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Let’s Explore Games',
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: CarouselView(
                  itemExtent: MediaQuery.of(context).size.width * 0.85,
                  shape: LinearBorder(),
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  children: events.map((path) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF131C35)),
              child: TextField(
                style: TextStyle(
                  color: Color(0xFF8D92A3),
                ),
                decoration: InputDecoration(
                  hintText: 'Search Game',
                  hintStyle: TextStyle(color: Color(0xFF8D92A3), fontSize: 14),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF8D92A3),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            if (_searchQuery.isEmpty) ...[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'Popular Games',
                        style: TextStyle(
                          color: Color(0xFF1E90B5),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CarouselView(
                          onTap: (int index) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailGame(game: searchGame[index]),
                              ),
                            );
                          },
                          itemExtent: MediaQuery.of(context).size.width * 0.7,
                          shape: LinearBorder(),
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          itemSnapping: true,
                          children: searchGame.take(5).map((path) {
                            return Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(path.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  path.name,
                                  style: TextStyle(
                                    color: Color(0xFF8D92A3),
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                        'New Games',
                        style: TextStyle(
                          color: Color(0xFF1E90B5),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CarouselView(
                          itemExtent: MediaQuery.of(context).size.width * 0.7,
                          shape: LinearBorder(),
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          itemSnapping: true,
                          children: searchGame.skip(5).map((path) {
                            return Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(path.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  path.name,
                                  style: TextStyle(
                                    color: Color(0xFF8D92A3),
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            );
                          }).toList(),
                          onTap: (int index) {
                            if (index == 0) {
                              index = 5;
                            } else if (index == 1) {
                              index = 6;
                            } else if (index == 2) {
                              index = 7;
                            } else if (index == 3) {
                              index = 8;
                            } else if (index == 4) {
                              index = 9;
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailGame(game: searchGame[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ] else ...[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  'Search Game',
                  style: TextStyle(
                    color: Color(0xFF1E90B5),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CarouselView(
                    onTap: (int index) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailGame(game: searchGame[index]),
                        ),
                      );
                    },
                    itemExtent: MediaQuery.of(context).size.width * 0.7,
                    shape: LinearBorder(),
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemSnapping: true,
                    children: searchGame.take(5).map((path) {
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(path.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            path.name,
                            style: TextStyle(
                              color: Color(0xFF8D92A3),
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
