// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.themeMode});

  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];

  ThemeState copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
