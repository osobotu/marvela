import 'package:Marvela/home/home.dart';
import 'package:favorites_repository/favorites_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_repository/marvel_repository.dart';

import 'core/theme/theme.dart';

class MarvelaApp extends StatelessWidget {
  const MarvelaApp({
    super.key,
    required MarvelRepository marvelRepository,
    required FavoritesRepository favoritesRepository,
  })  : _marvelRepository = marvelRepository,
        _favoritesRepository = favoritesRepository;

  final MarvelRepository _marvelRepository;
  final FavoritesRepository _favoritesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _marvelRepository),
        RepositoryProvider.value(value: _favoritesRepository),
      ],
      child: BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
        child: MarvelaAppView(),
      ),
    );
  }
}

class MarvelaAppView extends StatelessWidget {
  const MarvelaAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          theme: appThemeData[AppTheme.light],
          darkTheme: appThemeData[AppTheme.dark],
          home: Home(),
        );
      },
    );
  }
}
