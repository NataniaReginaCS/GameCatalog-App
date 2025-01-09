class News {
  final String name;
  final String image;
  final String description;
  final String source;

  const News(
    this.name,
    this.image,
    this.description,
    this.source,
  );
}

final List<News> news = _new
    .map((e) => News(
          (e['name'] as String),
          (e['image'] as String),
          (e['description'] as String),
          (e['source'] as String),
        ))
    .toList(growable: false);

final List<Map<String, dynamic>> _new = [
  {
    'name': 'Genshin Impact Version 5.3 Introduces New Characters',
    'image': 'images/News/berita1.jpg',
    'description':
        'Hoyoverse officially launched the Genshin Impact version 5.3 update on January 1, 2025.The update introduces a new playable character, Mavuika, an Archon (god) leading Natlan, a fiery Pyro nation. Mavuika has a unique skill to summon a motorcycle, allowing players to explore Teyvat on land, air, and water. In addition to Mavuika, players can play as Citlali, a five-star character from Natlan, and Lan Yan, a four-star character who protects teammates.The update also includes new events, such as the Lantern Rite festival in Liyue, new skins, enemies, and other exciting features.',
    'source': 'RumahBerita',
  },
  {
    'name': 'VALORANT Patch Notes 9.0',
    'image': 'images/News/berita2.jpg',
    'description':
        'VALORANT Patch Notes 9.0 introduces significant updates, including new voice lines for various agents such as Phoenix, Yoru, and Sage. Iso’s Double Tap ability duration has been reduced from 20s to 12s, with the removal of the signature kill reset. Sova’s Owl Drone HP has been increased to 100. Abyss has been added to the Ranked map pool, and Competitive Mode is now available on console. Players can choose between new Controls Presets for consoles and customize settings. The update also includes several bug fixes and improvements in gameplay systems, player behavior, and Premier updates with the Path to Pro initiative. Finally, Voice Chat settings have been enhanced for console players',
    'source': 'Riot Games',
  },
  {
    'name': 'New Dota 2 Hero: Void Spirit Introduction (Coming After TI9)',
    'image': 'images/News/berita3.jpg',
    'description':
        'After the Dota 2 International 2019, Valve officially announced two new heroes coming to the game: Void Spirit and Snapfire. Void Spirit, the fourth member of the Spirit family, joins Ember Spirit, Earth Spirit, and Storm Spirit. He brings a new element to the game, with abilities yet to be fully revealed. The hero is described as being from Claszureme, a realm outside time, and his appearance in the game is linked to a disturbance in the power balance. Void Spirit is expected to be a flexible carry hero with a teleportation skill, debuff abilities, and a dual-sided sword for combat and spellcasting. The release of Void Spirit is scheduled for Fall 2019, following Snapfires release. Speculations about his abilities have been circulating in the community for years, with predictions from Dota 2 YouTuber SirActionSlacks.',
    'source': 'DOTA2FREAKS',
  },
  {
    'name': 'Dota 2 Patch 7.37d: Major Item Nerfs and Key Hero Buffs',
    'image': 'images/News/berita4.jpg',
    'description':
        'Dota 2 Patch 7.37d, released on October 1, 2024, introduces several important changes to the game, focusing on item nerfs and hero buffs. Some major nerfs include Arcane Boots, which now cost 100 more gold and provide less mana regeneration, and Bracer, which no longer doubles its bonuses at minute 25. Items like Disperser and Gleipnir have also been weakened, reducing their effectiveness. On the hero side, Anti-Mage gets a buff to his Mana Break and level 10 talent, improving his durability and damage against spellcasters. Death Prophets Exorcism ability now summons 10 spirits at level 1, boosting her early-game power. Dazzle sees buffs to his attack speed and Poison Touch damage, making him a viable core hero. Doom and Lich receive minor buffs, improving their efficiency in farming and defense. However, the patch also brings significant nerfs to heroes like Kunkka, whose Ghostship damage and Admirals Rum duration have been reduced, and Clockwerk, whose Power Cogs has less control in fights. Other heroes like Marcy, Luna, and Sand King have received notable nerfs, which will likely reduce their effectiveness in future matches.',
    'source': 'DOTA2FREAKS',
  },
  {
    'name': 'New Dota 2 Single Matchmaking Rank with Role Performance',
    'image': 'images/News/berita5.jpg',
    'description':
        'Dota 2s new Ranked Matchmaking update, released in March 2020, has introduced a significant change in how player ranks are displayed. Instead of the previous system, which split ranks into support and core categories, the update now uses a single rank that encompasses all roles. This change ensures that players are evaluated based on their overall skill across all roles but also tracks role-specific performance. For example, a player with an "Ancient" rank might have a high rank for support roles (Position 4 and 5) but a lower rank for core roles (Position 1 and 2). The main goal of this update is to provide more balanced matchmaking by adjusting players performance based on the role they play. Now, players can track their role performance through the Role Queue menu, where each roles handicap is displayed. The previous support and core MMR system, introduced in 2019, had players ranked separately for different roles, but it was seen as imperfect by many. The removal of this system aims to make the matchmaking process fairer, particularly for roles like position 5 (Hard Support), which were less popular and had longer queue times. This update has received mixed reactions, but many players agree that it’s a step in the right direction for a more balanced and accurate ranking system. The performance-based system may still be a work in progress, but if successful, it could stay as the new standard for ranked matchmaking in Dota 2.',
    'source': 'DOTA2FREAKS',
  },
];
