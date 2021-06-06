import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiservicios_tun/models/Cliente.dart';

class Ccliente extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CclienteState();
}

class _CclienteState extends State<Ccliente> {
  String url = 'https://apiserviciostunv1.000webhostapp.com/api/clientes/1';

  Future<Cliente> futureCliente;

  Future<Cliente> fetchCliente() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Cliente.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Fallo al cargar el Cliente');
    }
  }

  @override
  void initState() {
    super.initState();
    futureCliente = fetchCliente();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text('Multiservicios Tun')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Cliente>(
            future: futureCliente,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new Container(
                    child: new Column(children: <Widget>[
                  Text(
                    "Información Personal",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: snapshot.data.nombre,
                      enabled: false,
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                    //controller: myController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    minWidth: 200.0,
                    height: 40.0,
                    onPressed: () {
                      //Aqui van los metodos para el registro de orden
                      //_mostrarAlerta(context);
                      Navigator.pop(context);
                    },
                    color: Colors.indigo,
                    child: Text('Registrar orden',
                        style: TextStyle(color: Colors.white)),
                  ),
                ]));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
