import 'package:Marvela/core/services/firebase_analytics_service.dart';
import 'package:Marvela/favorites_characters/bloc/favorite_characters_bloc.dart';
import 'package:favorites_repository/favorites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_repository/marvel_repository.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.character});

  final Character character;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void didChangeDependencies() {
    AnalyticsService.instance.setCurrentScreen(screenName: 'details_screen');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: ListView(
            children: [
              Container(
                child: Image.network(
                    '${widget.character.thumbnail.path}.${widget.character.thumbnail.extension}'),
              ),
              SizedBox(height: 16),
              Text(
                widget.character.description.isEmpty
                    ? 'No description provided'
                    : widget.character.description,
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
                          description: widget.character.description,
                          id: widget.character.id,
                          name: widget.character.name,
                          resourceURI: widget.character.resourceURI,
                          isFavorite: true,
                          thumbnail: FavoriteThumbnail(
                              path: widget.character.thumbnail.path,
                              extension: widget.character.thumbnail.extension),
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
