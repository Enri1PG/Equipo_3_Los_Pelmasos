import 'package:flutter/material.dart';
import 'package:proyecto_videoteca/LogIn.dart';



void main() => runApp(farmacia_App());

class farmacia_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginPage.id,
      routes: {LoginPage.id: (context) => LoginPage()},
    );
  }
}

