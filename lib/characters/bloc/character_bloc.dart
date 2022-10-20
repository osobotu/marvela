import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_repository/marvel_repository.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'character_event.dart';
part 'character_state.dart';

const throttleDuration = Duration(milliseconds: 100);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc({required this.marvelRepository}) : super(CharacterState()) {
    /// Event handlers
    on<CharacterFetched>(_onCharacterFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  final MarvelRepository marvelRepository;

  Future<void> _onCharacterFetched(
      CharacterFetched event, Emitter<CharacterState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == CharacterStatus.initial) {
        final characters = await marvelRepository.fetchCharacters();
        return emit(state.copyWith(
          status: CharacterStatus.success,
          characters: List.of(state.characters)..addAll(characters),
          hasReachedMax: false,
        ));
      }

      final characters = await marvelRepository.fetchCharacters(
          offset: state.characters.length);

      characters.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: CharacterStatus.success,
                characters: List.of(state.characters)..addAll(characters),
              ),
            );
    } catch (error, st) {
      emit(state.copyWith(status: CharacterStatus.failure));
    }
  }
}
