// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_characters_bloc.dart';

enum FavoriteCharactersStatus { initial, loading, success, failure }

class FavoriteCharactersState extends Equatable {
  const FavoriteCharactersState({
    this.status = FavoriteCharactersStatus.initial,
    this.favoriteCharacters = const [],
  });

  final FavoriteCharactersStatus status;
  final List<FavoriteCharacter> favoriteCharacters;

  @override
  List<Object> get props => [status, favoriteCharacters];

  FavoriteCharactersState copyWith({
    FavoriteCharactersStatus? status,
    List<FavoriteCharacter>? favoriteCharacters,
  }) {
    return FavoriteCharactersState(
      status: status ?? this.status,
      favoriteCharacters: favoriteCharacters ?? this.favoriteCharacters,
    );
  }
}
