// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

enum SearchStatus {
  initial,
  searching,
  found,
  error,
}

class SearchState extends Equatable {
  const SearchState({
    required this.status,
    required this.result,
  });

  final SearchStatus status;
  final List<Character> result;

  @override
  List<Object> get props => [status, result];

  SearchState copyWith({
    SearchStatus? status,
    List<Character>? result,
  }) {
    return SearchState(
      status: status ?? this.status,
      result: result ?? this.result,
    );
  }
}
