import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiservicios_tun/models/Orden.dart';

class Corden extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CordenState();
}

class _CordenState extends State<Corden> {
  Future<List<Orden>> getRequest() async {
    String url = "https://apiserviciostunv1.000webhostapp.com/api/ordenes";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Orden> ordenes = [];
    for (var singleOrden in responseData["data"]) {
      Orden orden = Orden(
        id: singleOrden["id"],
        fecha: DateTime.parse(singleOrden["fecha"]),
        tecnico: singleOrden["tecnico"],
        clienteId: singleOrden["cliente_id"],
        vehiculoId: singleOrden["vehiculo_id"],
        cilindros: singleOrden["cilindros"],
        condicionventaId: singleOrden["condicionventa_id"],
        urgenciainicial: singleOrden["urgenciainicial"],
        atencion: singleOrden["atencion"],
        trabajo: singleOrden["trabajo"],
        centrocostoId: singleOrden["centrocosto_id"],
        /*placa: singleOrden["placa"],
        ceniceros: singleOrden["ceniceros"],
        cristalesRotos: singleOrden["cristales_rotos"],
        quemacocos: singleOrden["quemacocos"],
        espejoIzq: singleOrden["espejo_izq"],
        espejoDer: singleOrden["espejo_der"],
        tapon: singleOrden["tapon"],
        antena: singleOrden["antena"],
        tapetes: singleOrden["tapetes"],
        varilla: singleOrden["varilla"],
        radio: singleOrden["radio"],
        espejoInt: singleOrden["espejo_int"],
        gato: singleOrden["gato"],
        extinguidor: singleOrden["extinguidor"],
        emblemas: singleOrden["emblemas"],
        encendedor: singleOrden["encendedor"],
        llanta: singleOrden["llanta"],*/
        km: singleOrden["km"],
        combustible: singleOrden["combustible"],
        transmision: singleOrden["transmision"],
        vestiduras: singleOrden["vestiduras"],
      );

      //Adding orden to the list.
      ordenes.add(orden);
    }
    return ordenes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text('Catalogo de servicios')),
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
                      backgroundImage: AssetImage('images/orden_icon.png'),
                    ),
                    title: Text(snapshot.data[index].tecnico),
                    subtitle: Text("Fecha: " +
                        snapshot.data[index].fecha.toString().substring(0, 10) +
                        "   " +
                        "Cliente: " +
                        snapshot.data[index].clienteId.toString()),
                    onTap: () {
                      _showAlertError(
                          context,
                          snapshot.data[index].fecha,
                          snapshot.data[index].tecnico,
                          snapshot.data[index].clienteId,
                          snapshot.data[index].vehiculoId,
                          snapshot.data[index].cilindros,
                          snapshot.data[index].condicionventaId,
                          snapshot.data[index].urgenciainicial,
                          snapshot.data[index].atencion,
                          snapshot.data[index].trabajo,
                          snapshot.data[index].km,
                          snapshot.data[index].combustible,
                          snapshot.data[index].transmision,
                          snapshot.data[index].vestiduras);
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
  DateTime fecha,
  String tecnico,
  int clienteId,
  int vehiculoId,
  String cilindros,
  int condicionventaId,
  String urgenciainicial,
  dynamic atencion,
  String trabajo,
  double km,
  double combustible,
  String transmision,
  String vestiduras,
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
                  "Fecha",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: fecha.toIso8601String().substring(0, 10),
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Nombre del técnico",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: tecnico,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Cliente",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: clienteId.toString(),
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Vehículo",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: vehiculoId.toString(),
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Atencion",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: atencion,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Trabajo realizado",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: trabajo,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Condicion de venta",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: condicionventaId.toString(),
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Urgencia inicial",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: urgenciainicial,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Kilometros",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: km.toString(),
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Combustible",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: combustible.toString(),
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Transmisión",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: transmision,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Vestiduras",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: vestiduras,
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
