import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
          themeMode: ThemeMode.dark,
        )) {
    on<ThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    if (event.themeMode == ThemeMode.light) {
      emit(
        state.copyWith(
          themeMode: ThemeMode.dark,
        ),
      );
    } else {
      emit(
        state.copyWith(
          themeMode: ThemeMode.light,
        ),
      );
    }
  }
}
