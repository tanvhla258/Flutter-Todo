import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/widgets/todo_list.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 119, 132, 251));
final theme = ThemeData(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 247, 242, 250),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
  cardTheme: const CardTheme().copyWith(
      color: kColorScheme.secondaryContainer, margin: const EdgeInsets.all(16)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: kColorScheme.primaryContainer,
  )),
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const TodoList());
  }
}

// import 'package:flutter/services.dart';

