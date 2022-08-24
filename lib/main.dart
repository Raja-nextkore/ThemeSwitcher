import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_switcher/local_storage.dart';

import 'theme_provider.dart';
import 'theme.dart';

void main() async {
  String currentTheme = await LocalStorage.getTheme() ?? 'light';
  runApp(
    App(
      currentTheme: currentTheme,
    ),
  );
}

class App extends StatelessWidget {
  final String currentTheme;
  const App({Key? key, required this.currentTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(currentTheme),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: Scaffold(
              body: Center(
                child: IconButton(
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                  icon: themeProvider.themeMode == ThemeMode.dark
                      ? const Icon(Icons.light_mode)
                      : const Icon(Icons.dark_mode),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
