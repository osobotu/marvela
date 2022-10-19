import 'package:Marvela/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isLightTheme = state.themeMode == ThemeMode.light;
        return Column(
          children: [
            ListTile(
              title: Text(isLightTheme ? 'Light' : 'Dark'),
              trailing: Switch(
                value: isLightTheme,
                onChanged: (value) {
                  context.read<ThemeBloc>()
                    ..add(
                      ThemeChanged(
                        value ? ThemeMode.dark : ThemeMode.light,
                      ),
                    );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
