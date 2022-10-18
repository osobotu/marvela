import 'package:Marvela/characters/characters.dart';
import 'package:Marvela/characters/view/characters_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterBloc(marvelRepository: context.read())
        ..add(CharacterFetched()),
      child: CharactersView(),
    );
  }
}
