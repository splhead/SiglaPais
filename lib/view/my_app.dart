import 'package:flutter/material.dart';
import 'package:sigla_pais_app/view/paises_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siglas dos Países',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      home: PaisesScreen(),
    );
  }
}