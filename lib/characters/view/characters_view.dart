import 'package:Marvela/characters/characters.dart';
import 'package:Marvela/characters/widgets/widgets.dart';
import 'package:Marvela/core/core_widgets/core_widgets.dart';
import 'package:Marvela/favorites_characters/view/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return CharactersList();
  }
}

class CharactersList extends StatefulWidget {
  const CharactersList({super.key});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
      switch (state.status) {
        case CharacterStatus.initial:
          return Center(
            child: CircularProgressIndicator(),
          );
        case CharacterStatus.success:
          return Scrollbar(
            controller: _scrollController,
            child: size.width < 865
                ? ListView.builder(
                    itemCount: state.hasReachedMax
                        ? state.characters.length
                        : state.characters.length + 1,
                    controller: _scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return index >= state.characters.length
                          ? BottomLoader()
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsView(
                                      character: state.characters[index],
                                    ),
                                  ),
                                );
                              },
                              child: CharacterListItem(
                                  dateCreated: "",
                                  imageUrl:
                                      '${state.characters[index].thumbnail.path}.${state.characters[index].thumbnail.extension}',
                                  name: state.characters[index].name),
                            );
                    })
                : GridView.builder(
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5),
                    itemCount: state.hasReachedMax
                        ? state.characters.length
                        : state.characters.length + 1,
                    itemBuilder: (context, index) {
                      return index >= state.characters.length
                          ? BottomLoader()
                          : CharacterItem(
                              item: state.characters[index],
                              onCharacterTapped: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsView(
                                      character: state.characters[index],
                                    ),
                                  ),
                                );
                              },
                            );
                    }),
          );
        case CharacterStatus.failure:
          return Center(
            child: Text('Failed to fetch characters'),
          );
      }
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<CharacterBloc>().add(CharacterFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
