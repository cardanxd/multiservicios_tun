import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/paginas/panel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiservicios Tun',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigo,
        brightness: Brightness.light,
        fontFamily: 'Georgia',
      ),
      home: Panel(),
    );
  }
}
