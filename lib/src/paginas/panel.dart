import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/widget/OrdenContainer.dart';
import 'package:multiservicios_tun/src/widget/ClienteContainer.dart';
import 'package:multiservicios_tun/src/widget/VehiculoContainer.dart';
import 'package:multiservicios_tun/src/widget/consultas/ClienteConsulta.dart';
import 'package:multiservicios_tun/src/widget/consultas/OrdenConsulta.dart';
import 'package:multiservicios_tun/src/widget/consultas/VehiculoConsulta.dart';

class Panel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    RegisterWidget(),
    ConsultaWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text('Multiservicios Tun')),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Registros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Consultas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: _onItemTapped,
      ),
    );
  }
}

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Divider(height: 8.0),
        ClienteContainer(),
        Divider(height: 8.0),
        VehiculoContainer(),
        Divider(height: 8.0),
        OrdenContainer(),
        Divider(height: 8.0),
      ],
    );
  }
}

class ConsultaWidget extends StatelessWidget {
  const ConsultaWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Divider(height: 8.0),
        ClienteConsulta(),
        Divider(height: 8.0),
        VehiculoConsulta(),
        Divider(height: 8.0),
        OrdenConsulta(),
        Divider(height: 8.0),
      ],
    );
  }
}
