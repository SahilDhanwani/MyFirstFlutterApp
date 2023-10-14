import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 29;
  final String name = "SAHIL D's APP";

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of flutter by $name"),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}