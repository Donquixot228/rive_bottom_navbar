import 'package:flutter/material.dart';
import 'package:rive_animation/pages/entry_poit/entry_point_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation Bar with Rive Animation',
      home: EntryPoint(),
    );
  }
}
