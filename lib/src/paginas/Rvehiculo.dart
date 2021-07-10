import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multiservicios_tun/models/ClienteGet.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:multiservicios_tun/models/Vehiculo.dart';

class Rvehiculo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RvehiculoState();
}

//Método para crear el vehiculo
Future<Vehiculo> crearVehiculo(int clienteId, String equipo, String marca,
    String modelo, String serie, String economico, String placa) async {
  final Uri url =
      Uri.parse("https://apiserviciostunv1.000webhostapp.com/api/vehiculos");
  final response = await http.post(url, body: {
    "cliente_id": clienteId.toString(),
    "equipo": equipo,
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
  bool isLoading = false;
  //Método para consultar los clientes
  List<String> autoCompleteClient;
  List<Cliente> clientes = [];
  Future<bool> getRequestClient() async {
    setState(() {
      isLoading = true;
    });
    final Uri url =
        Uri.parse("https://apiserviciostunv1.000webhostapp.com/api/clientes");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = clienteGetDataFromJson(response.body);
      clientes = result.data;
      setState(() {
        isLoading = false;
      });
      return true;
    } else {
      return false;
    }
  }

  //Método para autocompletar los clientes
  Future fetchAutoCompleteClient() async {
    isLoading = true;

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteClient = jsonStringData;
    });
  }

  //Controladores
  Vehiculo _vehiculo;
  TextEditingController _cliente;
  final _equipo = TextEditingController();
  final _marca = TextEditingController();
  final _modelo = TextEditingController();
  final _serie = TextEditingController();
  final _economico = TextEditingController();
  final _placa = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteClient();
    getRequestClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(centerTitle: true, title: Text('Registro de vehiculo')),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  Autocomplete(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      } else {
                        return autoCompleteClient.where((word) => word
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()));
                      }
                    },
                    optionsViewBuilder:
                        (context, Function(String) onSelected, options) {
                      return Material(
                        elevation: 4,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final cliente = clientes[index];
                            return ListTile(
                              title: SubstringHighlight(
                                text: cliente.nombre,
                                term: _cliente.text,
                                textStyleHighlight:
                                    TextStyle(fontWeight: FontWeight.w700),
                              ),
                              subtitle: SubstringHighlight(
                                text: cliente.email,
                                term: _cliente.text,
                                textStyleHighlight:
                                    TextStyle(fontWeight: FontWeight.w700),
                              ),
                              onTap: () {
                                onSelected(cliente.id.toString());
                              },
                            );
                          },
                          itemCount: clientes.length,
                        ),
                      );
                    },
                    onSelected: (selectedString) {
                      print(selectedString);
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                      this._cliente = controller;

                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        onEditingComplete: onEditingComplete,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]),
                          ),
                          hintText: "Seleccione el cliente",
                          prefixIcon: Icon(Icons.search),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _equipo,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      hintText: "Tipo de equipo",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _marca,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      hintText: "Marca",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _modelo,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      hintText: "Modelo",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _serie,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      hintText: "Número de serie",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _economico,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      hintText: "Número económico",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _placa,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      hintText: "Placas",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    child: Text('Registrar vehiculo',
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
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Fluttertoast.showToast(msg: "Registro en proceso...");
                      final cliente = int.parse(_cliente.text);
                      final equipo = _equipo.text;
                      final marca = _marca.text;
                      final modelo = _modelo.text;
                      final serie = _serie.text;
                      final economico = _economico.text;
                      final placa = _placa.text;

                      final Vehiculo vehiculo = await crearVehiculo(cliente,
                          equipo, marca, modelo, serie, economico, placa);
                      setState(() {
                        _vehiculo = vehiculo;
                      });
                      if (_vehiculo == null) {
                        isLoading = false;
                        _showAlertError(context);
                      } else {
                        await Future.delayed(Duration(seconds: 1));
                        Fluttertoast.showToast(msg: "Registro exitosamente");
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            ),
    );
  }
}

void _showAlertError(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => new AlertDialog(
            title: Text('¡Problemas en el registro!'),
            content:
                Text('Verifique que los campos estén llenos o sean correctos.'),
            actions: [
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ));
}
