import 'package:flutter/material.dart';
import 'package:user_card/src/features/user/view/user_card_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserCardScreen(),
    );
  }
}
