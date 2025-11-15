import 'package:flutter/material.dart';
import 'package:soccer_live/home_screen.dart';

void main() {
  runApp(const SoccerLive());
}

class SoccerLive extends StatelessWidget {
  const SoccerLive({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
