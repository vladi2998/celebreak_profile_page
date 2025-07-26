// lib/src/core/presentation/a_app.dart
import 'package:flutter/material.dart';
import 'package:celebreak_profile_page/src/features/profile/presentation/pages/profile_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Player Profile',
      // ThemeData.dark() by default to easily get a black background and white text
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
      ),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false, // Removes the debug banner
    );
  }
}
