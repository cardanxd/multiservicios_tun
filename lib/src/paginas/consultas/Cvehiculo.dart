import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiservicios_tun/models/Vehiculo.dart';

class Cvehiculo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CvehiculoState();
}

class _CvehiculoState extends State<Cvehiculo> {
  Future<List<Vehiculo>> getRequest() async {
    String url = "https://apiserviciostunv1.000webhostapp.com/api/vehiculos";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Vehiculo> vehiculos = [];
    for (var singleCar in responseData["data"]) {
      Vehiculo vehiculo = Vehiculo(
        id: singleCar["id"],
        clienteId: singleCar["cliente_id"],
        equipo: singleCar["equipo"],
        marca: singleCar["marca"],
        modelo: singleCar["modelo"],
        serie: singleCar["serie"],
        economico: singleCar["economico"],
        placa: singleCar["placa"],
      );

      //Adding vehiculo to the list.
      vehiculos.add(vehiculo);
    }
    return vehiculos;
  }

  /*Future<List<Cliente>> getRequestCliente() async {
    String url =
        "https://apiserviciostunv1.000webhostapp.com/api/vehiculos/cliente/1";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Cliente> clientes = [];
    for (var singleCar in responseData["data"]) {
      Cliente cliente = Cliente(
        id: singleCar["id"],
        nombre: singleCar["nombre"],
      );

      //Adding vehiculo to the list.
      clientes.add(cliente);
    }
    return clientes;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text('Catalogo de vehiculos')),
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
                      backgroundImage: AssetImage('images/vehiculo_icon.png'),
                    ),
                    title: Text(snapshot.data[index].equipo),
                    subtitle: Text("Marca: " +
                        snapshot.data[index].marca +
                        "   " +
                        "Cliente: " +
                        snapshot.data[index].clienteId.toString()),
                    onTap: () {
                      _showAlertError(
                          context,
                          snapshot.data[index].clienteId.toString(),
                          snapshot.data[index].equipo,
                          snapshot.data[index].marca,
                          snapshot.data[index].modelo,
                          snapshot.data[index].serie,
                          snapshot.data[index].economico,
                          snapshot.data[index].placa);
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
  String clienteId,
  String equipo,
  String marca,
  String modelo,
  String serie,
  String economico,
  String placa,
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
                  "Cliente",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: clienteId,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Equipo",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: equipo,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Marca",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: marca,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Modelo",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: modelo,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Número de serie",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: serie,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Número económico",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: economico,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Placas",
                  style: _style(),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: placa,
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                /*ElevatedButton(
                  child: Text('Ver cliente',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    onPrimary: Colors.grey[900],
                    shadowColor: Colors.black,
                    elevation: 5,
                    minimumSize: Size(150, 40),
                    alignment: Alignment.center,
                    shape: StadiumBorder(),
                    side: BorderSide(color: Colors.indigo[600], width: 2),
                  ),
                  onPressed: () async {
                    print("object");
                  },
                )*/
              ],
            ),
          )));
}

TextStyle _style() {
  return TextStyle(fontWeight: FontWeight.bold, color: Colors.grey);
}
