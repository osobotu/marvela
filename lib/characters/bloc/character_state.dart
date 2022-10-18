// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_bloc.dart';

enum CharacterStatus { initial, success, failure }

class CharacterState extends Equatable {
  const CharacterState({
    this.status = CharacterStatus.initial,
    this.characters = const <Character>[],
    this.hasReachedMax = false,
  });

  final CharacterStatus status;
  final List<Character> characters;
  final bool hasReachedMax;

  @override
  List<Object> get props => [status, characters, hasReachedMax];

  CharacterState copyWith({
    CharacterStatus? status,
    List<Character>? characters,
    bool? hasReachedMax,
  }) {
    return CharacterState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  bool get stringify => true;
}
