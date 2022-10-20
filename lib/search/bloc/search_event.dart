// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchSubmitted extends SearchEvent {
  const SearchSubmitted({required this.searchName});

  final String searchName;

  @override
  List<Object> get props => [searchName];
  SearchSubmitted copyWith({
    String? searchName,
  }) {
    return SearchSubmitted(
      searchName: searchName ?? this.searchName,
    );
  }
}

class SearchReset extends SearchEvent {
  @override
  List<Object?> get props => [];
}
