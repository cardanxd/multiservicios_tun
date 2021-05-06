import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/paginas/panel.dart';
import 'package:multiservicios_tun/src/paginas/Rcliente.dart';

class MyApp extends StatelessWidget {

  bool _showPerfomanceOverlay = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: _showPerfomanceOverlay,
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => Panel(),
        '/Rcliente': (context) => Rcliente()
      },
    );
  }
}