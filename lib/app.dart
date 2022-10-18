import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_repository/marvel_repository.dart';

import 'characters/characters.dart';

class MarvelaApp extends StatelessWidget {
  const MarvelaApp({super.key, required MarvelRepository marvelRepository})
      : _marvelRepository = marvelRepository;

  final MarvelRepository _marvelRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _marvelRepository,
      child: MarvelaAppView(),
    );
  }
}

class MarvelaAppView extends StatelessWidget {
  const MarvelaAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        textTheme: GoogleFonts.amaranthTextTheme(),
        primarySwatch: Colors.orange,
      ),
      home: CharactersPage(),
    );
  }
}
