class Game {
  final String name;
  final String image;
  final String description;
  final double price;
  final int popularity;
  final String status;
  final List<String> gameplay;

  const Game(this.name, this.image, this.description, this.price,
      this.popularity, this.status, this.gameplay);
}

final List<Game> games = _game
    .map((e) => Game(
        (e['name'] as String),
        (e['image'] as String),
        (e['description'] as String),
        (e['price'] as num).toDouble(),
        (e['popularity'] as num).toInt(),
        (e['status'] as String),
        List<String>.from(e['gameplay'] as List)))
    .toList(growable: false);

final List<Map<String, dynamic>> _game = [
  {
    'name': 'Dota 2',
    'image': 'images/Game/game1.jpg',
    'description':
        'Dota 2 is a 2013 multiplayer online battle arena (MOBA) video game by Valve. The game is a sequel to Defense of the Ancients (DotA), a community-created mod for Blizzard Entertainments Warcraft III: Reign of Chaos. Dota 2 is played in matches between two teams of five players, with each team occupying and defending their own separate base on the map. Each of the ten players independently controls a character known as a hero that has unique abilities and differing styles of play. During a match, players collect experience points (XP) and items for their heroes to defeat the opposing teams heroes in player versus player (PvP) combat. A team wins by being the first to destroy the other teams Ancient, a large durable structure located in the center of each base.',
    'price': 18.0,
    'popularity': 185000000,
    'status': 'latest',
    'gameplay': [
      'images/Game/Dota2_1/gameplay1.jpg',
      'images/Game/Dota2_1/gameplay2.jpg',
      'images/Game/Dota2_1/gameplay3.jpg',
      'images/Game/Dota2_1/gameplay4.jpg',
    ],
  },
  {
    'name': 'Minecraft',
    'image': 'images/Game/game2.jpg',
    'description':
        'Minecraft is a 2011 sandbox game developed and published by Swedish video game developer Mojang Studios. Originally created by Markus Notch Persson using the Java programming language, the first public beta build was released on 17 May 2009. The game would be continuously developed from then on, receiving a full release on 18 November 2011. Afterwards, Persson left Mojang and gave Jens Jeb Bergensten control over development. In the years since its release, it has been ported to several platforms, including smartphones, tablets, and various video game consoles. In 2014, Mojang and the Minecraft intellectual property were purchased by Microsoft for US2.5 billion. Minecraft is the best-selling video game of all-time, with over 300 million copies sold and nearly 170 million monthly active players as of 2024.',
    'price': 19.99,
    'popularity': 2000000000,
    'status': 'latest',
    'gameplay': [
      'images/Game/minecraft_2/gameplay1.jpg',
      'images/Game/minecraft_2/gameplay2.jpg',
      'images/Game/minecraft_2/gameplay3.jpg',
      'images/Game/minecraft_2/gameplay4.jpg',
    ],
  },
  {
    'name': 'Honkai Star Rail',
    'image': 'images/Game/game3.jpg',
    'description':
        'Honkai Star Rail is a free-to-play role-playing gacha video game developed and published by miHoYo (with publishing outside mainland China under Cognosphere, d/b/a HoYoverse). It is miHoYos first turn-based game, featuring the main character, who is referred to as the Trailblazer, travelling across planets through the Astral Express to help and connect the worlds while resolving disasters caused by Stellarons and other third-parties. The first closed beta test was launched on October 27, 2021. It was publicly released internationally on April 26, 2023, for Windows and mobile devices. Additionally, the PlayStation 5 port was released on October 11, 2023. The PlayStation 4 version is still yet to be announced, as revealed at the 2023 Summer Game Fest with a trailer. It is the fourth installment in the Honkai series, utilizing some characters from Honkai Impact 3rd and some gameplay elements from Genshin Impact.',
    'price': 10.99,
    'popularity': 550000000,
    'status': 'latest',
    'gameplay': [
      'images/Game/HSR_#/gameplay1.jpg',
      'images/Game/HSR_/gameplay2.jpg',
      'images/Game/HSR_/gameplay3.jpg',
      'images/Game/HSR_/gameplay4.jpg',
    ],
  },
  {
    'name': 'Fortnite',
    'image': 'images/Game/game4.jpg',
    'description':
        'Fortnite is an online video game and game platform developed by Epic Games and released in 2017. It is available in seven distinct game mode versions that otherwise share the same general gameplay and game engine: Fortnite Battle Royale, a free-to-play battle royale game in which up to 100 players fight to be the last person standing; Fortnite: Save the World, a cooperative hybrid tower defense-shooter and survival game in which up to four players fight off zombie-like creatures and defend objects with traps and fortifications they can build; Fortnite Creative, in which players are given complete freedom to create worlds and battle arenas; Lego Fortnite, an open world game collection divided between survival game Lego Fortnite Odyssey and social game Lego Fortnite Brick Life; Rocket Racing, a racing game; Fortnite Festival, a rhythm game; and Fortnite Ballistic, a tactical first-person shooter currently in early access.',
    'price': 5.0,
    'popularity': 350000000,
    'status': 'latest',
    'gameplay': [
      'images/Game/fortnite_4/gameplay1.jpg',
      'images/Game/fortnite_4/gameplay2.jpg',
      'images/Game/fortnite_4/gameplay3.jpg',
      'images/Game/fortnite_4/gameplay4.jpg',
    ],
  },
  {
    'name': 'Zenless Zone Zero',
    'image': 'images/Game/game5.jpg',
    'description':
        'Zenless Zone Zero is an action role-playing game. The player assumes the role of a Proxy (the protagonist known as Wise or Belle), a character who helps others explore alternate dimensions called Hollows. Over time, the Proxy will recruit new party members known as Agents to fight hostile entities called Ethereals and other enemies. In addition to the Proxy, players use rabbit-like robotic assistants known as Bangboos. The gameplay is split into two different modes: a TV Mode and Combat Mode. TV Mode gameplay resembles a 2D dungeon crawler game, with the Proxy roaming on tiles that resemble televisions to find treasure, solve puzzles and fight enemies. If the Proxy steps on an enemy tile, the party is sent to Combat Mode, where they fight in a 3D hack and slash-like game mode.',
    'price': 7.7,
    'popularity': 115000000,
    'status': 'latest',
    'gameplay': [
      'images/Game/ZZZ_5/gameplay1.jpg',
      'images/Game/ZZZ_5/gameplay2.jpg',
      'images/Game/ZZZ_5/gameplay3.jpg',
      'images/Game/ZZZ_5/gameplay4.jpg',
    ],
  },
  {
    'name': 'Valorant',
    'image': 'images/Game/game6.jpg',
    'description':
        'Valorant is a team-based first-person tactical hero shooter set in the near future. Players play as one of a set of Agents, characters based on several countries and cultures around the world. In the main game mode, players are assigned to either the attacking or defending team with each team having five players on it. Agents have unique abilities, each requiring charges, as well as a unique ultimate ability that requires charging through kills, deaths, orbs, or objectives. Every player starts each round with a classic pistol and one or more signature ability charges. Other weapons and ability charges can be purchased using an in-game economic system that awards money based on the outcome of the previous round, any kills the player is responsible for, and any objectives completed. The game has an assortment of weapons including secondary guns like sidearms and primary guns like submachine guns, shotguns, machine guns, assault rifles and sniper rifles. There are automatic and semi-automatic weapons that each have a unique shooting pattern that has to be controlled by the player to be able to shoot accurately. It currently offers 24 agents to choose from.',
    'price': 6.8,
    'popularity': 14000000,
    'status': 'newest',
    'gameplay': [
      'images/Game/valorant_6/gameplay1.jpg',
      'images/Game/valorant_6/gameplay2.jpg',
      'images/Game/valorant_6/gameplay3.jpg',
      'images/Game/valorant_6/gameplay4.jpg',
    ],
  },
  {
    'name': 'League of Legends',
    'image': 'images/Game/game7.jpg',
    'description':
        'League of Legends (LoL), commonly referred to as League, is a 2009 multiplayer online battle arena video game developed and published by Riot Games. Inspired by Defense of the Ancients, a custom map for Warcraft III, Riots founders sought to develop a stand-alone game in the same genre. Since its release in October 2009, League has been free-to-play and is monetized through purchasable character customization. The game is available for Microsoft Windows and macOS. In the game, two teams of five players battle in player-versus-player combat, each team occupying and defending their half of the map. Each of the ten players controls a character, known as a champion, with unique abilities and differing styles of play. During a match, champions become more powerful by collecting experience points, earning gold, and purchasing items to defeat the opposing team. In Leagues main mode, Summoners Rift, a team wins by pushing through to the enemy base and destroying their Nexus, a large structure located within.',
    'price': 0.0,
    'popularity': 4800000,
    'status': 'newest',
    'gameplay': [
      'images/Game/Lol_7/gameplay1.jpg',
      'images/Game/Lol_7/gameplay2.jpg',
      'images/Game/Lol_7/gameplay3.jpg',
      'images/Game/Lol_7/gameplay4.jpg',
    ],
  },
  {
    'name': 'PUBG Battlegrounds',
    'image': 'images/Game/game8.jpg',
    'description':
        'PUBG: Battlegrounds (previously known as PlayerUnknowns Battlegrounds) is a 2017 battle royale video game published by Krafton, and developed by Kraftons PUBG Studios. The game, which was inspired by the Japanese film Battle Royale (2000), is based on previous mods created by Brendan PlayerUnknown Greene for other games, and expanded into a standalone game under Greenes creative direction. Played from either a third-person or first-person perspective, up to one hundred players parachute onto an island where they are tasked to scavenge for weapons and equipment to kill other players while avoiding getting killed themselves. The available safe area of the games map decreases in size over time, directing surviving players into an ever-tightening space to force encounters.',
    'price': 7.2,
    'popularity': 70000000,
    'status': 'newest',
    'gameplay': [
      'images/Game/pubg_8/gameplay1.jpg',
      'images/Game/pubg_8/gameplay2.jpg',
      'images/Game/pubg_8/gameplay3.jpg',
      'images/Game/pubg_8/gameplay4.jpg',
    ],
  },
  {
    'name': 'Mobile Legends',
    'image': 'images/Game/game9.jpg',
    'description':
        'Mobile Legends is a MOBA game designed for mobile phones. Each team consists of five players who fight to reach and destroy the enemys base while defending their own base to control three lanes, known as the top, middle, and bottom lanes, which connect to each base. In each team, there are five players controlling their own avatars, known as heroes, from their own devices. Weak characters controlled by the computer are called minions, which spawn at the teams base and spread across the three lanes to fight towers and opponents that block their path. Collecting EXP is useful for leveling up heroes as the game progresses.',
    'price': 15.55,
    'popularity': 75000000,
    'status': 'newest',
    'gameplay': [
      'images/Game/ml_9/gameplay1.jpg',
      'images/Game/ml_9/gameplay2.jpg',
      'images/Game/ml_9/gameplay3.jpg',
      'images/Game/ml_9/gameplay4.jpg',
    ],
  },
  {
    'name': 'Genshin Impact',
    'image': 'images/Game/game10.jpg',
    'description':
        'Genshin Impact is a 2020 action role-playing video game produced by MiHoYo/HoYoverse. The game features an anime-style open world environment and an action-based battle system using elemental magic and character-switching. A free-to-play game monetized through gacha game mechanics, Genshin Impact is updated regularly using the games as a service model; it was originally released for Android, iOS, PlayStation 4, and Windows, followed by PlayStation 5 in 2021, with an Xbox Series X/S version in November 2024. Genshin Impact takes place in the fantasy world of Teyvat, home to seven nations, each of which is tied to a different element and ruled by a different god (archon). The story follows the Traveler, an interstellar adventurer who, at the start of the game, is separated from their twin sibling after the two land in Teyvat. Thereafter, the Traveler journeys across the nations of Teyvat in search of the lost sibling, accompanied by their guide, Paimon. Along the way, the two befriend myriad individuals, become involved in the affairs of its nations, and begin to unravel the mysteries of the land.',
    'price': 15.0,
    'popularity': 600000,
    'status': 'newest',
    'gameplay': [
      'images/Game/genshin_10/gameplay1.jpg',
      'images/Game/genshin_10/gameplay2.jpg',
      'images/Game/genshin_10/gameplay3.jpg',
      'images/Game/genshin_10/gameplay4.jpg',
    ],
  },
];
