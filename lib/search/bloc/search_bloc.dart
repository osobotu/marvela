import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_repository/marvel_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.marvelRepository})
      : super(
          SearchState(
            status: SearchStatus.initial,
            result: [],
          ),
        ) {
    on<SearchSubmitted>(_onSearchSubmitted);
    on<SearchReset>(_onSearchReset);
  }

  final MarvelRepository marvelRepository;
  Future<void> _onSearchSubmitted(
      SearchSubmitted event, Emitter<SearchState> emit) async {
    if (event.searchName.isEmpty) return;
    try {
      emit(
        state.copyWith(status: SearchStatus.searching),
      );
      final result = await marvelRepository.fetchCharacters(
          nameStartsWith: event.searchName);
      emit(
        state.copyWith(result: result, status: SearchStatus.found),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: SearchStatus.error,
        ),
      );
    }
  }

  Future<void> _onSearchReset(
      SearchReset event, Emitter<SearchState> emit) async {
    emit(
      state.copyWith(status: SearchStatus.initial),
    );
  }
}
