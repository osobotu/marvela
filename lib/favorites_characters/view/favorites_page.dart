import 'package:Marvela/favorites_characters/favorite_characters.dart';
import 'package:Marvela/favorites_characters/view/favorites_view.dart';
import 'package:favorites_repository/favorites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCharactersBloc(
        favoritesRepository: context.read<FavoritesRepository>(),
      )..add(FavoriteCharactersSubscriptionRequested()),
      child: FavoritesView(),
    );
  }
}
