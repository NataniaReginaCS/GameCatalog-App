import 'package:flutter/material.dart';
import 'package:gamecatalog/entity/game.dart';
import 'package:gamecatalog/content/detailgame.dart';

class GameList extends StatefulWidget {
  const GameList({super.key});

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  String _selectedFilter = 'Popularity';
  late List<Game> listGames;

  @override
  void initState() {
    super.initState();
    listGames = List.from(games)
      ..sort((a, b) => b.popularity.compareTo(a.popularity));
  }

  void _applyFilter() {
    setState(() {
      if (_selectedFilter == 'Popularity') {
        listGames.sort((a, b) => b.popularity.compareTo(a.popularity));
      } else if (_selectedFilter == 'Price') {
        listGames.sort((b, a) => a.price.compareTo(b.price));
      }
    });
  }

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
                  'Game List',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${listGames.length} Games',
                  style: TextStyle(
                    color: Color(0xFF8D92A3),
                    fontSize: 16,
                  ),
                ),
                DropdownButton(
                  value: _selectedFilter,
                  dropdownColor: Color(0xFF15244D),
                  icon: Icon(Icons.arrow_drop_down, color: Color(0xFF8D92A3)),
                  underline: Container(),
                  items: ['Popularity', 'Price']
                      .map((filter) => DropdownMenuItem(
                            value: filter,
                            child: Text(
                              filter,
                              style: TextStyle(color: Color(0xFF8D92A3)),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedFilter = value!;
                      _applyFilter();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listGames.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 20, left: 5, right: 0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        listGames[index].image,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 50,
                      ),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            listGames[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1E90B5),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Icon(
                                Icons.group,
                                color: Color(0xFF8D92A3),
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  listGames[index].popularity.toString(),
                                  style: TextStyle(
                                    color: Color(0xFF8D92A3),
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: Color(0xFF8D92A3),
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  listGames[index].price.toString(),
                                  style: TextStyle(
                                    color: Color(0xFF8D92A3),
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
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
                          builder: (context) =>
                              DetailGame(game: listGames[index]),
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
      ),
    );
  }
}
