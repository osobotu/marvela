import 'package:Marvela/app.dart';
import 'package:flutter/material.dart';
import 'package:marvel_repository/marvel_repository.dart';

void main() {
  runApp(
    MarvelaApp(
      marvelRepository: MarvelRepository(),
    ),
  );
}
