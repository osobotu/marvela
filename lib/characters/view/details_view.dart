import 'package:flutter/material.dart';
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
    );
  }
}
