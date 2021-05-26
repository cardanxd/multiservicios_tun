import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiservicios_tun/models/Cliente.dart';
import 'package:multiservicios_tun/models/Album.dart';

class Rcliente extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RclienteState();
}

class _RclienteState extends State<Rcliente> {
  String url = 'https://jsonplaceholder.typicode.com/albums/1';
  //String url = 'http://localhost/ApiTun/public/clientes/1';

  Future<Album> futureAlbum;

  Future<Album> fetchAlbum() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
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
        child: FutureBuilder<Album>(
            future: futureAlbum,
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
                      labelText: snapshot.data.title,
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
