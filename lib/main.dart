import 'package:flutter/material.dart';
import 'package:xogame/game.dart';
import 'package:xogame/homepage.dart';

void main() {
  runApp(const XoGame());
}

class XoGame extends StatefulWidget {
  const XoGame({super.key});

  @override
  State<XoGame> createState() => _XoGameState();
}

class _XoGameState extends State<XoGame> {
   List<String> names=[];
  @override
  Widget build(BuildContext context) =>MaterialApp(
    theme: ThemeData.dark(),
    home: homepage(),

  );
}

 