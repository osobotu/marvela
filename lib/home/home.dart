import 'package:Marvela/characters/characters.dart';
import 'package:Marvela/core/services/firebase_analytics_service.dart';
import 'package:Marvela/favorites_characters/favorite_characters.dart';

import 'package:Marvela/search/view/views.dart';

import 'package:flutter/material.dart';

import '../settings/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    AnalyticsService.instance.setCurrentScreen(screenName: 'home_screen');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marvela'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
              AnalyticsService.instance.logEvent(
                name: 'visit_search',
              );
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [CharactersPage(), FavoritesPage(), SettingsPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
