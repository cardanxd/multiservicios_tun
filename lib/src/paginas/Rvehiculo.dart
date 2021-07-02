import 'dart:convert';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    "cliente_id": cliente.toString(),
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
  bool isLoading = false;
  List<String> autoCompleteData;

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  Vehiculo _vehiculo;
  final _cliente = TextEditingController();
  TextEditingController _tipov;
  final _marca = TextEditingController();
  final _modelo = TextEditingController();
  final _serie = TextEditingController();
  final _economico = TextEditingController();
  final _placa = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.indigo,
            title: Text('Multiservicios Tun')),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: <Widget>[
                    Autocomplete(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        } else {
                          return autoCompleteData.where((word) => word
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
                              final option = options.elementAt(index);
                              return ListTile(
                                //title: Text(option.toString()),
                                title: SubstringHighlight(
                                  text: option.toString(),
                                  term: _tipov.text,
                                  textStyleHighlight:
                                      TextStyle(fontWeight: FontWeight.w700),
                                ),
                                subtitle: Text("Esto es un subtitulo"),
                                onTap: () {
                                  onSelected(option.toString());
                                },
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: options.length,
                          ),
                        );
                      },
                      onSelected: (selectedString) {
                        print(selectedString);
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
                        this._tipov = controller;

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
                            hintText: "Seleccione el tipo de equipo",
                            prefixIcon: Icon(Icons.search),
                          ),
                        );
                      },
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _cliente,
                      decoration: InputDecoration(
                        labelText: 'Cliente',
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
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final cliente = int.parse(_cliente.text);
            final tipov = _tipov.text;
            //final tipo = _tipo.text;
            final marca = _marca.text;
            final modelo = _modelo.text;
            final serie = _serie.text;
            final economico = _economico.text;
            final placa = _placa.text;

            final Vehiculo vehiculo = await crearVehiculo(
                cliente, tipov, marca, modelo, serie, economico, placa);
            setState(() {
              _vehiculo = vehiculo;
            });
            if (_vehiculo == null) {
              _showAlertError(context);
            } else {
              Navigator.pop(context);
            }
          },
          tooltip: 'Registrar',
          backgroundColor: Colors.indigo,
          label: const Text('Registrar'),
          icon: const Icon(Icons.thumb_up),
        ));
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
