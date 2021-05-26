import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiservicios_tun/models/Album.dart';

class Rcliente extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RclienteState();
}

class _RclienteState extends State<Rcliente> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;

  Future<Album> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.indigo,
            title: Text('Multiservicios Tun')),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ));
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: 'Enter Title'),
        ),
        SizedBox(
          height: 20.0,
        ),
        MaterialButton(
          minWidth: 200.0,
          height: 40.0,
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller.text);
            });
            Navigator.pop(context);
          },
          color: Colors.indigo,
          child:
              Text('Registrar cliente', style: TextStyle(color: Colors.white)),
        ),
        SizedBox(
          height: 20.0,
        ),
        MaterialButton(
          minWidth: 200.0,
          height: 40.0,
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.indigo,
          child: Text('Cancelar', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
  }
}
