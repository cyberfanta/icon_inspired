import 'package:flutter/material.dart';
import 'package:icon_inspired/views/screens/main_view/main_view.dart';

import 'data/repositories/repository.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository.initialize();

    return MaterialApp(
      initialRoute: MainMenuView.routeName,
      routes: {
        // MainMenu
        MainMenuView.routeName: (context) => const MainMenuView(),
      },
    );
  }
}
