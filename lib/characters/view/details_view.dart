import 'package:Marvela/favorites_characters/bloc/favorite_characters_bloc.dart';
import 'package:favorites_repository/favorites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_repository/marvel_repository.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: ListView(
            children: [
              Container(
                child: Image.network(
                    '${character.thumbnail.path}.${character.thumbnail.extension}'),
              ),
              SizedBox(height: 16),
              Text(
                character.description.isEmpty
                    ? 'No description provided'
                    : character.description,
                textAlign: TextAlign.justify,
                style: theme.textTheme.headline5,
              ),
              SizedBox(height: 16),
              Text(
                'Data provided by Marvel. © 2022 MARVEL',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BlocProvider(
        create: (context) => FavoriteCharactersBloc(
            favoritesRepository: context.read<FavoritesRepository>()),
        child: Builder(
          builder: (context) {
            return FloatingActionButton(
              tooltip: 'Add to favorites',
              onPressed: () {
                context.read<FavoriteCharactersBloc>().add(
                      FavoriteCharacterAdded(
                        FavoriteCharacter(
                          createdAt: DateTime.now().toString(),
                          description: character.description,
                          id: character.id,
                          name: character.name,
                          resourceURI: character.resourceURI,
                          isFavorite: true,
                          thumbnail: FavoriteThumbnail(
                              path: character.thumbnail.path,
                              extension: character.thumbnail.extension),
                        ),
                      ),
                    );
              },
              child: Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
