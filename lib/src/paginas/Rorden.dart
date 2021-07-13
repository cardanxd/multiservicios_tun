import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:multiservicios_tun/models/CentroCosto.dart';
import 'package:multiservicios_tun/models/Condicion.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:multiservicios_tun/models/ClienteGet.dart';
import 'package:multiservicios_tun/models/Orden.dart';
import 'package:multiservicios_tun/models/VehiculoGet.dart';

class Rorden extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RordenState();
}

Future<Orden> crearOrden(
    DateTime fecha,
    String tecnico,
    int clienteId,
    int vehiculoId,
    String cilindros,
    int condicionventaId,
    String urgenciainicial,
    dynamic atencion,
    String trabajo,
    int centrocostoId,
    String placa,
    String ceniceros,
    String cristalesRotos,
    String quemacocos,
    String espejoIzq,
    String espejoDer,
    String tapon,
    String antena,
    String tapetes,
    String varilla,
    String radio,
    String espejoInt,
    String gato,
    String extinguidor,
    String emblemas,
    String encendedor,
    String llanta,
    double km,
    double combustible,
    String transmision,
    String vestiduras) async {
  final Uri url =
      Uri.parse("https://apiserviciostunv1.000webhostapp.com/api/ordenes");
  final response = await http.post(url, body: {
    "fecha": fecha.toIso8601String(),
    "tecnico": tecnico,
    "cliente_id": clienteId.toString(),
    "vehiculo_id": vehiculoId.toString(),
    "cilindros": cilindros,
    "condicionventa_id": condicionventaId.toString(),
    "urgenciainicial": urgenciainicial,
    "atencion": atencion,
    "trabajo": trabajo,
    "centrocosto_id": centrocostoId.toString(),
    "placa": placa,
    "ceniceros": ceniceros,
    "cristales_rotos": cristalesRotos,
    "quemacocos": quemacocos,
    "espejo_izq": espejoIzq,
    "espejo_der": espejoDer,
    "tapon": tapon,
    "antena": antena,
    "tapetes": tapetes,
    "varilla": varilla,
    "radio": radio,
    "espejo_int": espejoInt,
    "gato": gato,
    "extinguidor": extinguidor,
    "emblemas": emblemas,
    "encendedor": encendedor,
    "llanta": llanta,
    "km": km.toString(),
    "combustible": combustible.toString(),
    "transmision": transmision,
    "vestiduras": vestiduras,
  });
  if (response.statusCode == 201) {
    return ordenFromJson(response.body);
  } else {
    return null;
  }
}

class _RordenState extends State<Rorden> {
  bool isLoading = false;
  bool isLoadingCliente = false;

  List<String> autoCompleteClient;
  List<Cliente> clientes = [];
  Future<bool> getRequestClient() async {
    final Uri url =
        Uri.parse("https://apiserviciostunv1.000webhostapp.com/api/clientes");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = clienteGetDataFromJson(response.body);
      clientes = result.data;
      return true;
    } else {
      return false;
    }
  }

  List<String> autoCompleteVehiculo;
  List<Vehiculo> vehiculos = [];
  Future<bool> getRequestVehiculo() async {
    final Uri url = Uri.parse(
        "https://apiserviciostunv1.000webhostapp.com/api/clientes/vehiculos/$clienteId");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = vehiculoDataGetFromJson(response.body);
      vehiculos = result.data;
      return true;
    } else {
      return false;
    }
  }

  List<String> autoCompleteCosto;
  List<CentroCosto> costos = [];
  Future<bool> getRequestCosto() async {
    final Uri url = Uri.parse(
        "https://apiserviciostunv1.000webhostapp.com/api/centrocostos");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = centrocostoFromJson(response.body);
      costos = result.data;
      return true;
    } else {
      return false;
    }
  }

  List<String> autoCompleteCondicion;
  List<Condicion> condiciones = [];
  Future<bool> getRequestCondicion() async {
    final Uri url = Uri.parse(
        "https://apiserviciostunv1.000webhostapp.com/api/condiciones");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = condicionDataFromJson(response.body);
      condiciones = result.data;
      return true;
    } else {
      return false;
    }
  }

  Future fetchAutoCompleteClient() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteClient = jsonStringData;
    });
  }

  Future fetchAutoCompleteVehiculo() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteVehiculo = jsonStringData;
    });
  }

  Future fetchAutoCompleteCosto() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteCosto = jsonStringData;
    });
  }

  Future fetchAutoCompleteCondiciones() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteCondicion = jsonStringData;
    });
  }

  DateTime now = new DateTime.now();
  Orden _orden;
  final List<String> prueba = ["true", "false"];
  String urgenciainicial = 'Baja';
  bool placas = false;
  bool ceniceros = false;
  bool cristalesrotos = false;
  bool quemacocos = false;
  bool espejoizq = false;
  bool espejoder = false;
  bool espejosint = false;
  bool tapon = false;
  bool antena = false;
  bool tapetes = false;
  bool varilla = false;
  bool reloj = false;
  bool manija = false;
  bool radio = false;
  bool gato = false;
  bool extinguidor = false;
  bool emblemas = false;
  bool encendedor = false;
  bool llanta = false;

  final _fecha = TextEditingController();
  final _tecnico = TextEditingController();
  TextEditingController _cliente;
  TextEditingController _vehiculo;
  String clienteId;
  final _cilindros = TextEditingController();
  TextEditingController _condicionventa;
  final _atencion = TextEditingController();
  final _trabajo = TextEditingController();
  TextEditingController _centrocosto;
  final _km = TextEditingController();
  final _combustible = TextEditingController();
  final _transmision = TextEditingController();
  final _vestiduras = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteClient();
    fetchAutoCompleteCosto();
    fetchAutoCompleteCondiciones();
    getRequestClient();
    getRequestCosto();
    getRequestCondicion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(centerTitle: true, title: Text('Registro de orden')),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Fecha:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _fecha,
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
                        labelText: "$now",
                        enabled: false,
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Técnico:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _tecnico,
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
                        labelText: "Nombre del técnico",
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
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
                                //title: Text(option.toString()),
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
                                  setState(() {
                                    clienteId = cliente.id.toString();
                                    fetchAutoCompleteVehiculo();
                                    getRequestVehiculo();
                                  });
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

                        return TextFormField(
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
                            labelText: "Seleccione el cliente",
                            prefixIcon: Icon(Icons.search),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Autocomplete(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        } else {
                          return autoCompleteVehiculo.where((word) => word
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
                              final vehiculo = vehiculos[index];
                              return ListTile(
                                title: SubstringHighlight(
                                  text: "Vehículo: " + vehiculo.equipo,
                                  term: _vehiculo.text,
                                  textStyleHighlight:
                                      TextStyle(fontWeight: FontWeight.w700),
                                ),
                                subtitle: SubstringHighlight(
                                  text: "Serie: " + vehiculo.serie,
                                  term: _vehiculo.text,
                                  textStyleHighlight:
                                      TextStyle(fontWeight: FontWeight.w700),
                                ),
                                onTap: () {
                                  onSelected(vehiculo.id.toString());
                                },
                              );
                            },
                            itemCount: vehiculos.length,
                          ),
                        );
                      },
                      onSelected: (selectedString) {
                        print(selectedString);
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
                        this._vehiculo = controller;

                        return TextFormField(
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
                            labelText: "Seleccione el vehiculo",
                            prefixIcon: Icon(Icons.search),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _cilindros,
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
                        labelText: "Cilindros",
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Autocomplete(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        } else {
                          return autoCompleteCondicion.where((word) => word
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()));
                        }
                      },
                      optionsViewBuilder:
                          (context, Function(String) onSelected, options) {
                        return Material(
                          elevation: 4,
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final condicion = condiciones[index];
                              return ListTile(
                                //title: Text(option.toString()),
                                title: SubstringHighlight(
                                  text: condicion.descripcion,
                                  term: _condicionventa.text,
                                  textStyleHighlight:
                                      TextStyle(fontWeight: FontWeight.w700),
                                ),
                                //subtitle: Text("Esto es un subtitulo"),
                                onTap: () {
                                  onSelected(condicion.id.toString());
                                },
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: condiciones.length,
                          ),
                        );
                      },
                      onSelected: (selectedString) {
                        print(selectedString);
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
                        this._condicionventa = controller;

                        return TextFormField(
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
                            labelText: "Seleccione la condicion de venta",
                            prefixIcon: Icon(Icons.search),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Urgencia Inicial:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DropdownButton<String>(
                      value: urgenciainicial,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      onChanged: (value) {
                        setState(() {
                          urgenciainicial = value;
                        });
                      },
                      items: <String>['Baja', 'Media', 'Alta']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    //Nombre del chofer
                    Text(
                      "Atencion:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _atencion,
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
                        labelText: "Atención",
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Trabajo realizado:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _trabajo,
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
                        labelText: "Trabajo realizado",
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Autocomplete(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        } else {
                          return autoCompleteCosto.where((word) => word
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()));
                        }
                      },
                      optionsViewBuilder:
                          (context, Function(String) onSelected, options) {
                        return Material(
                          elevation: 4,
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final costo = costos[index];
                              return ListTile(
                                //title: Text(option.toString()),
                                title: SubstringHighlight(
                                  text: costo.descripcion,
                                  term: _centrocosto.text,
                                  textStyleHighlight:
                                      TextStyle(fontWeight: FontWeight.w700),
                                ),
                                onTap: () {
                                  onSelected(costo.id.toString());
                                },
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: costos.length,
                          ),
                        );
                      },
                      onSelected: (selectedString) {
                        print(selectedString);
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
                        this._centrocosto = controller;

                        return TextFormField(
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
                            labelText: "Seleccione el centro costo",
                            prefixIcon: Icon(Icons.search),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Inventario del vehiculo",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "Placas",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: placas,
                            onChanged: (value) {
                              setState(() {
                                placas = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Ceniceros",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: ceniceros,
                            onChanged: (value) {
                              setState(() {
                                ceniceros = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Cristales rotos",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: cristalesrotos,
                            onChanged: (value) {
                              setState(() {
                                cristalesrotos = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Quemacocos",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: quemacocos,
                            onChanged: (value) {
                              setState(() {
                                quemacocos = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Espejo izquierdo",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: espejoizq,
                            onChanged: (value) {
                              setState(() {
                                espejoizq = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Espejo derecho",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: espejoder,
                            onChanged: (value) {
                              setState(() {
                                espejoder = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Espejo interior",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: espejosint,
                            onChanged: (value) {
                              setState(() {
                                espejosint = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Tapon",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: tapon,
                            onChanged: (value) {
                              setState(() {
                                tapon = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Antena",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: antena,
                            onChanged: (value) {
                              setState(() {
                                antena = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Tapetes",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: tapetes,
                            onChanged: (value) {
                              setState(() {
                                tapetes = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Varilla",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: varilla,
                            onChanged: (value) {
                              setState(() {
                                varilla = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Reloj",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: reloj,
                            onChanged: (value) {
                              setState(() {
                                reloj = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Manija",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: manija,
                            onChanged: (value) {
                              setState(() {
                                manija = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Radio",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: radio,
                            onChanged: (value) {
                              setState(() {
                                radio = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Gato",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: gato,
                            onChanged: (value) {
                              setState(() {
                                gato = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Extinguidor",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: extinguidor,
                            onChanged: (value) {
                              setState(() {
                                extinguidor = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Emblemas",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: emblemas,
                            onChanged: (value) {
                              setState(() {
                                emblemas = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Encendedor",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: encendedor,
                            onChanged: (value) {
                              setState(() {
                                encendedor = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    Row(
                      children: [
                        Text(
                          "Llanta",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                            value: llanta,
                            onChanged: (value) {
                              setState(() {
                                llanta = value;
                              });
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Divider(height: 5),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Estado del vehiculo",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _km,
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
                        labelText: "Kilometraje",
                        helperText: "Número con decimales",
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _combustible,
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
                        labelText: "Nivel de combustible",
                        helperText: "Número con decimales",
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _transmision,
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
                        labelText: "Transmisión",
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _vestiduras,
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
                        labelText: "Vestiduras",
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      child: Text('Registrar orden',
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

                        final fecha = DateTime.now();
                        String vendedor;
                        if (_tecnico.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'vendedor');
                          });
                        } else {
                          vendedor = _tecnico.text;
                        }
                        int cliente;
                        if (_cliente.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'cliente');
                          });
                        } else {
                          cliente = int.parse(_cliente.text);
                        }
                        int vehiculo;
                        if (_vehiculo.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'vehiculo');
                          });
                        } else {
                          vehiculo = int.parse(_vehiculo.text);
                        }
                        String cilindros;
                        if (_cilindros.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'cilindros');
                          });
                        } else {
                          cilindros = _cilindros.text;
                        }
                        int condicionventa;
                        if (_condicionventa.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'condicion de venta');
                          });
                        } else {
                          condicionventa = int.parse(_condicionventa.text);
                        }
                        final urgenciainicial1 = urgenciainicial;
                        String atencion;
                        if (_atencion.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'atención');
                          });
                        } else {
                          atencion = _atencion.text;
                        }
                        String trabajo;
                        if (_trabajo.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'trabajo');
                          });
                        } else {
                          trabajo = _trabajo.text;
                        }
                        int centrocosto;
                        if (_centrocosto.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'centro costo');
                          });
                        } else {
                          centrocosto = int.parse(_centrocosto.text);
                        }
                        final placa1 = placas.toString();
                        final ceniceros1 = ceniceros.toString();
                        final cristalesRotos1 = cristalesrotos.toString();
                        final quemacocos1 = quemacocos.toString();
                        final espejoIzq1 = espejoizq.toString();
                        final espejoDer1 = espejoder.toString();
                        final tapon1 = tapon.toString();
                        final antena1 = antena.toString();
                        final tapetes1 = tapetes.toString();
                        final varilla1 = varilla.toString();
                        final radio1 = radio.toString();
                        final espejoInt1 = espejosint.toString();
                        final gato1 = gato.toString();
                        final extinguidor1 = extinguidor.toString();
                        final emblemas1 = emblemas.toString();
                        final encendedor1 = encendedor.toString();
                        final llanta1 = llanta.toString();
                        double km;
                        if (_km.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'kilometros');
                          });
                        } else {
                          km = double.parse(_km.text);
                        }
                        double combustible;
                        if (_combustible.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'combustible');
                          });
                        } else {
                          combustible = double.parse(_combustible.text);
                        }
                        String transmision;
                        if (_transmision.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'transmisión');
                          });
                        } else {
                          transmision = _transmision.text;
                        }
                        String vestiduras;
                        if (_vestiduras.text.isEmpty) {
                          setState(() {
                            isLoading = false;
                            _showAlert(context, 'vestiduras');
                          });
                        } else {
                          vestiduras = _vestiduras.text;
                        }

                        final Orden orden = await crearOrden(
                          fecha,
                          vendedor,
                          cliente,
                          vehiculo,
                          cilindros,
                          condicionventa,
                          urgenciainicial1,
                          atencion,
                          trabajo,
                          centrocosto,
                          placa1,
                          ceniceros1,
                          cristalesRotos1,
                          quemacocos1,
                          espejoIzq1,
                          espejoDer1,
                          tapon1,
                          antena1,
                          tapetes1,
                          varilla1,
                          radio1,
                          espejoInt1,
                          gato1,
                          extinguidor1,
                          emblemas1,
                          encendedor1,
                          llanta1,
                          km,
                          combustible,
                          transmision,
                          vestiduras,
                        );
                        setState(() {
                          _orden = orden;
                        });
                        if (_orden == null) {
                          isLoading = false;
                          _showAlertError(context,
                              'Verifique que los campos estén llenos o sean correctos.');
                        } else {
                          await Future.delayed(Duration(seconds: 1));
                          Fluttertoast.showToast(msg: "Registro exitosamente");
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

void _showAlert(BuildContext context, msg) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => new AlertDialog(
            title: Text('¡Problemas en el registro!'),
            content:
                Text('El campo $msg es obligatorio, por favor escriba el $msg'),
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

void _showAlertError(BuildContext context, msg) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => new AlertDialog(
            title: Text('¡Problemas en el registro!'),
            content: Text(msg),
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
