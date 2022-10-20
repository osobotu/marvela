import 'package:Marvela/characters/characters.dart';
import 'package:Marvela/characters/view/characters_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_repository/marvel_repository.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharacterBloc(marvelRepository: context.read<MarvelRepository>())
            ..add(CharacterFetched()),
      child: CharactersView(),
    );
  }
}
