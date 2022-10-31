part of 'favorite_characters_bloc.dart';

abstract class FavoriteCharactersEvent extends Equatable {
  const FavoriteCharactersEvent();

  @override
  List<Object> get props => [];
}

class FavoriteCharactersSubscriptionRequested extends FavoriteCharactersEvent {
  const FavoriteCharactersSubscriptionRequested();
}

class FavoriteCharacterAdded extends FavoriteCharactersEvent {
  const FavoriteCharacterAdded(this.character);

  final FavoriteCharacter character;

  @override
  List<Object> get props => [character];
}

class FavoriteCharacterRemoved extends FavoriteCharactersEvent {
  const FavoriteCharacterRemoved(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
