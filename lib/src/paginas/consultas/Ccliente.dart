import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiservicios_tun/models/Cliente.dart';

class Ccliente extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CclienteState();
}

class _CclienteState extends State<Ccliente> {
  Future<List<Cliente>> getRequest() async {
    String url = "https://apiserviciostunv1.000webhostapp.com/api/clientes";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Cliente> users = [];
    for (var singleUser in responseData["data"]) {
      Cliente user = Cliente(
        id: singleUser["id"],
        nombre: singleUser["nombre"],
        razon: singleUser["razon"],
        rfc: singleUser["rfc"],
        email: singleUser["email"],
        calle: singleUser["calle"],
        exterior: singleUser["exterior"],
        interior: singleUser["interior"],
        ecalle: singleUser["ecalle"],
        ycalle: singleUser["ycalle"],
        colonia: singleUser["colonia"],
        postal: singleUser["postal"],
        ciudad: singleUser["ciudad"],
        estado: singleUser["estado"],
        pais: singleUser["pais"],
        particular: singleUser["particular"],
        oficina: singleUser["oficina"],
        movil: singleUser["movil"],
        birthday: DateTime.parse(singleUser["birthday"]),
      );

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
          title: Text('Catalogo de clientes')),
      body: Container(
        padding: EdgeInsets.all(8.0),
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
                itemBuilder: (ctx, index) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(snapshot.data[index].nombre.substring(0, 1)),
                    ),
                    title: Text(snapshot.data[index].nombre),
                    subtitle: Text("Correo: " +
                        snapshot.data[index].email +
                        "   " +
                        "Tel: " +
                        snapshot.data[index].movil),
                    onTap: () {
                      _showAlertError(
                          context,
                          snapshot.data[index].nombre,
                          snapshot.data[index].razon,
                          snapshot.data[index].rfc,
                          snapshot.data[index].email,
                          snapshot.data[index].calle,
                          snapshot.data[index].exterior,
                          snapshot.data[index].interior,
                          snapshot.data[index].ecalle,
                          snapshot.data[index].ycalle,
                          snapshot.data[index].colonia,
                          snapshot.data[index].postal,
                          snapshot.data[index].ciudad,
                          snapshot.data[index].estado,
                          snapshot.data[index].pais,
                          snapshot.data[index].particular,
                          snapshot.data[index].oficina,
                          snapshot.data[index].movil,
                          snapshot.data[index].birthday);
                    },
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

void _showAlertError(
  BuildContext context,
  String nombre,
  String razon,
  String rfc,
  String email,
  String calle,
  String exterior,
  String interior,
  String ecalle,
  String ycalle,
  String colonia,
  String postal,
  String ciudad,
  String estado,
  String pais,
  String particular,
  String oficina,
  String movil,
  DateTime birthday,
) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => new Dialog(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Text(
                  "Nombre completo",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: nombre,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Correo electronico",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: email,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Número particular",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: particular,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Número oficina",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: oficina,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Número móvil",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: movil,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Calle",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: calle,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Exterior",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: exterior,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Interior",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: interior,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Entre calle",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: ecalle,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Y calle",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: ycalle,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Colonia",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: colonia,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Postal",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: postal,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Ciudad",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: ciudad,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Estado",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: estado,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "País",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: pais,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Fecha de cumpleaños",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: birthday.toIso8601String().substring(0, 10),
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
              ],
            ),
          )));
}

TextStyle _style() {
  return TextStyle(fontWeight: FontWeight.bold, color: Colors.grey);
}
