import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:multiservicios_tun/models/Vehiculo.dart';

class Rvehiculo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RvehiculoState();
}

Future<Vehiculo> crearVehiculo(int cliente, String tipo, String marca,
    String modelo, String serie, String economico, String placa) async {
  final String url =
      "https://apiserviciostunv1.000webhostapp.com/api/vehiculos";
  final response = await http.post(Uri.parse(url), body: {
    "cliente": cliente,
    "tipo": tipo,
    "marca": marca,
    "modelo": modelo,
    "serie": serie,
    "economico": economico,
    "placa": placa,
  });
  if (response.statusCode == 201) {
    return vehiculoFromJson(response.body);
  } else {
    return null;
  }
}

class _RvehiculoState extends State<Rvehiculo> {
  Vehiculo _vehiculo;
  final _cliente = TextEditingController();
  final _tipo = TextEditingController();
  final _marca = TextEditingController();
  final _modelo = TextEditingController();
  final _serie = TextEditingController();
  final _economico = TextEditingController();
  final _placa = TextEditingController();
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
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              controller: _cliente,
              decoration: InputDecoration(
                labelText: 'Cliente',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
            ),
            TextField(
              controller: _tipo,
              decoration: InputDecoration(
                labelText: 'Tipo de Equipo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
            ),
            TextField(
              controller: _marca,
              decoration: InputDecoration(
                labelText: 'Marca',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
            ),
            TextField(
              controller: _modelo,
              decoration: InputDecoration(
                labelText: 'Modelo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
            ),
            TextField(
              controller: _serie,
              decoration: InputDecoration(
                labelText: 'Num. Serie',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
            ),
            TextField(
              controller: _economico,
              decoration: InputDecoration(
                labelText: 'Num. Economico',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
            ),
            TextField(
              controller: _placa,
              decoration: InputDecoration(
                labelText: 'Placas',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            _vehiculo == null
                ? Container()
                : Text("El vehiculo fue creado satisfactoriamente")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //final cliente = int.parse(_cliente.text);
          final cliente = int.parse(_cliente.text);
          final tipo = _tipo.text;
          final marca = _marca.text;
          final modelo = _modelo.text;
          final serie = _serie.text;
          final economico = _economico.text;
          final placa = _placa.text;

          final Vehiculo vehiculo = await crearVehiculo(
              cliente, tipo, marca, modelo, serie, economico, placa);
          setState(() {
            _vehiculo = vehiculo;
          });
        },
        tooltip: 'Registrar',
        child: Icon(Icons.add),
      ),
    );
  }
}
