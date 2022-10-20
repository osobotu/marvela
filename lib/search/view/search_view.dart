import 'package:Marvela/characters/characters.dart';
import 'package:Marvela/characters/widgets/widgets.dart';
import 'package:Marvela/core/core.dart';
import 'package:Marvela/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_repository/marvel_repository.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          (context.watch<SearchBloc>().state.status == SearchStatus.found) ||
                  (context.watch<SearchBloc>().state.status ==
                      SearchStatus.error)
              ? IconButton(
                  onPressed: () {
                    context.read<SearchBloc>().add(SearchReset());
                  },
                  icon: Icon(Icons.refresh))
              : SizedBox.shrink(),
        ],
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          switch (state.status) {
            case SearchStatus.initial:
              return SearchInitial();
            case SearchStatus.searching:
              return BottomLoader();

            case SearchStatus.found:
              return SearchFound(result: state.result);

            case SearchStatus.error:
              return SearchError();
          }
        },
      ),
    );
  }
}

class SearchInitial extends StatefulWidget {
  const SearchInitial({super.key});

  @override
  State<SearchInitial> createState() => _SearchInitialState();
}

class _SearchInitialState extends State<SearchInitial> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: TextFormField(
              onFieldSubmitted: (value) {
                context.read<SearchBloc>().add(
                      SearchSubmitted(searchName: value),
                    );
              },
              autofocus: true,
              controller: searchController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'search character name'),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchFound extends StatelessWidget {
  const SearchFound({
    super.key,
    required this.result,
  });

  final List<Character> result;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        final item = result[index];
        return CharacterItem(
          item: item,
          onCharacterTapped: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsView(
                  character: item,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class SearchError extends StatelessWidget {
  const SearchError({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 100,
          ),
          Text(
            'Oops! \nNo character found',
            textAlign: TextAlign.center,
            style: theme.textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
