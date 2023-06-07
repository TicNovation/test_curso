import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  final texto;

  const SecondPage({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(texto),),
    );
  }
}