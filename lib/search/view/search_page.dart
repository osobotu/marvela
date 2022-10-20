import 'package:Marvela/search/search.dart';
import 'package:Marvela/search/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_repository/marvel_repository.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        marvelRepository: context.read<MarvelRepository>(),
      ),
      child: SearchView(),
    );
  }
}
