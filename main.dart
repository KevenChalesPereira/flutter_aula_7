import 'package:flutter/material.dart';
import 'package:imagens/novatela.dart';

void main() {
  runApp(const MaterialApp(home: Tela()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          body: Column(
        children: [],
      )),
    );
  }
}
