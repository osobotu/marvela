import 'package:Marvela/characters/characters.dart';
import 'package:Marvela/characters/view/details_view.dart';
import 'package:Marvela/characters/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:marvel_repository/marvel_repository.dart';

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
            child: ListView.builder(
                itemCount: state.hasReachedMax
                    ? state.characters.length
                    : state.characters.length + 1,
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index) {
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

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    Key? key,
    required this.item,
    this.onCharacterTapped,
  }) : super(key: key);

  final Character item;
  final void Function()? onCharacterTapped;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onCharacterTapped,
      leading: CircleAvatar(
        backgroundImage:
            NetworkImage('${item.thumbnail.path}.${item.thumbnail.extension}'),
      ),
      title: Text(item.name),
      subtitle: Text(
        DateFormat('dd-MM-yyyy').format(
          DateTime.parse(item.modifiedAt),
        ),
      ),
      // trailing: IconButton(
      //   onPressed: () {
      //     print('Favorite button tapped');
      //   },
      //   icon: Icon(
      //     item.isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
      //     color: Colors.amberAccent,
      //   ),
      // ),
      dense: true,
    );
  }
}
