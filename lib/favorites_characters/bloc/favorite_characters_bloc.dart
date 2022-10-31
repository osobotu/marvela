import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorites_repository/favorites_repository.dart';

part 'favorite_characters_event.dart';
part 'favorite_characters_state.dart';

class FavoriteCharactersBloc
    extends Bloc<FavoriteCharactersEvent, FavoriteCharactersState> {
  FavoriteCharactersBloc({required FavoritesRepository favoritesRepository})
      : _favoritesRepository = favoritesRepository,
        super(const FavoriteCharactersState()) {
    on<FavoriteCharactersSubscriptionRequested>(_onSubscriptionRequested);
    on<FavoriteCharacterAdded>(_onCharacterAdded);
    on<FavoriteCharacterRemoved>(_onCharacterRemoved);
  }

  final FavoritesRepository _favoritesRepository;

  Future<void> _onSubscriptionRequested(
    FavoriteCharactersSubscriptionRequested event,
    Emitter<FavoriteCharactersState> emit,
  ) async {
    emit(state.copyWith(status: FavoriteCharactersStatus.loading));
    await emit.forEach(
      _favoritesRepository.getFavorites(),
      onData: (favorites) => state.copyWith(
        status: FavoriteCharactersStatus.success,
        favoriteCharacters: favorites,
      ),
      onError: (_, __) =>
          state.copyWith(status: FavoriteCharactersStatus.failure),
    );
  }

  Future<void> _onCharacterAdded(
    FavoriteCharacterAdded event,
    Emitter<FavoriteCharactersState> emit,
  ) async {
    await _favoritesRepository.saveCharacter(event.character);
  }

  Future<void> _onCharacterRemoved(
    FavoriteCharacterRemoved event,
    Emitter<FavoriteCharactersState> emit,
  ) async {
    await _favoritesRepository.removeCharacter(event.id);
  }
}
