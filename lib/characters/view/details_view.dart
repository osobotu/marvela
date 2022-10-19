import 'package:flutter/material.dart';
import 'package:marvel_repository/marvel_repository.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
    );
  }
}
