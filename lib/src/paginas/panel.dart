import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/widget/OrdenContainer.dart';
import 'package:multiservicios_tun/src/widget/ClienteContainer.dart';
import 'package:multiservicios_tun/src/widget/VehiculoContainer.dart';

class Panel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.indigo,
            title: Text('Multiservicios Tun')),
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: ListView(
            children: [
              Divider(height: 20.0),
              ClienteContainer(),
              Divider(height: 20.0),
              VehiculoContainer(),
              Divider(height: 20.0),
              OrdenContainer(),
              Divider(height: 20.0),
            ],
          ),
        ));
  }
}
