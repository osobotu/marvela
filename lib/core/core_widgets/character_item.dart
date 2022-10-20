import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marvel_repository/marvel_repository.dart';

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
