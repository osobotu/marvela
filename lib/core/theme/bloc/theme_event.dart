part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChanged extends ThemeEvent {
  final ThemeMode themeMode;

  ThemeChanged(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}
