import 'package:first_app/utilities/routes.dart';
import 'package:first_app/widgets/theme.dart';
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
      
      // home: const HomePage(),

      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      debugShowCheckedModeBanner: false,

      initialRoute: RoutePage.homepage,
      routes: {
        RoutePage.homepage: (context) => const HomePage(),
        RoutePage.loginpage: (context) => const LoginPage()
      },
    );
  }
}