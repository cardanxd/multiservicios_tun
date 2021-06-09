import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String name;

  User({
    this.id,
    this.name,
  });
}

class Ccliente extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CclienteState();
}

class _CclienteState extends State<Ccliente> {
  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    String url = "https://apiserviciostunv1.000webhostapp.com/api/sucursales";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData["data"]) {
      User user = User(id: singleUser["id"], name: singleUser["nombre"]);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text('Multiservicios Tun')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: getRequest(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(snapshot.data[index].id.toString()),
                  subtitle: Text(snapshot.data[index].name),
                  contentPadding: EdgeInsets.only(bottom: 20.0),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
