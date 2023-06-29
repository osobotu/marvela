import 'package:Marvela/favorites_characters/favorite_characters.dart';
import 'package:Marvela/favorites_characters/view/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCharactersBloc, FavoriteCharactersState>(
      builder: (context, state) {
        switch (state.status) {
          case FavoriteCharactersStatus.initial:
            return Center(
              child: CircularProgressIndicator(),
            );
          case FavoriteCharactersStatus.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case FavoriteCharactersStatus.success:
            return ListView.builder(
              itemCount: state.favoriteCharacters.length,
              itemBuilder: (context, index) {
                final character = state.favoriteCharacters[index];
                return CharacterListItem(
                  dateCreated: character.createdAt,
                  imageUrl:
                      '${character.thumbnail.path}.${character.thumbnail.extension}',
                  name: character.name,
                );

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        '${character.thumbnail.path}.${character.thumbnail.extension}'),
                  ),
                  title: Text(character.name),
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      context
                          .read<FavoriteCharactersBloc>()
                          .add(FavoriteCharacterRemoved(character.id));
                    },
                  ),
                );
              },
            );

          case FavoriteCharactersStatus.failure:
            return Center(
              child: Text('Error occurred. Chill!'),
            );
        }
      },
    );
  }
}
