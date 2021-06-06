import 'package:flutter/material.dart';

import 'package:multiservicios_tun/src/widget/ClienteForm.dart';

class Rcliente extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RclienteState();
}

class _RclienteState extends State<Rcliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.indigo,
            title: Text('Multiservicios Tun')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[ClienteForm()],
          ),
        ));
  }
}
