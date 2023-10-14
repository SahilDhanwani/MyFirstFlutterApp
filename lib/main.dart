import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // initialRoute: "/home",
      routes: {
        "/": (context) => const LoginPage(),
      //   "/home": (context) => HomePage(),
      //   "/login": (context) => LoginPage()
      },
    );
  }
}  