import 'dart:convert';
import 'package:multiservicios_tun/models/Giro_comercial.dart';
import 'package:multiservicios_tun/models/Sucursal.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:multiservicios_tun/models/Cliente.dart';
import 'package:multiservicios_tun/models/Segmento.dart';

class Rcliente extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RclienteState();
}

Future<Cliente> createCliente(
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
    double limitecredito,
    int diascredito,
    int diasbloqueo,
    String descuento,
    DateTime birthday,
    int sucursalId,
    int segmentoId,
    int giroId) async {
  final String url = "https://apiserviciostunv1.000webhostapp.com/api/clientes";
  final response = await http.post(Uri.parse(url), body: {
    "nombre": nombre,
    "razon": razon,
    "rfc": rfc,
    "email": email,
    "calle": calle,
    "exterior": exterior,
    "interior": interior,
    "ecalle": ecalle,
    "ycalle": ycalle,
    "colonia": colonia,
    "postal": postal,
    "ciudad": ciudad,
    "estado": estado,
    "pais": pais,
    "particular": particular,
    "oficina": oficina,
    "movil": movil,
    "limitecredito": limitecredito.toString(),
    "diascredito": diascredito.toString(),
    "diasbloqueo": diasbloqueo.toString(),
    "descuento": descuento,
    "birthday": birthday.toIso8601String(),
    "sucursal_id": sucursalId.toString(),
    "segmento_id": segmentoId.toString(),
    "giro_id": giroId.toString(),
  });
  if (response.statusCode == 201) {
    final String responseString = response.body;
    return clienteFromJson(responseString);
  } else {
    return null;
  }
}

class _RclienteState extends State<Rcliente> {
  bool isLoading = false;
  List<String> autoCompleteSegmento;
  List<Segmento> segmentos = [];
  Future<bool> getRequestSegmentos() async {
    final Uri url =
        Uri.parse("https://apiserviciostunv1.000webhostapp.com/api/segmentos");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = segmentoDataFromJson(response.body);
      segmentos = result.data;
      return true;
    } else {
      return false;
    }
  }

  List<String> autoCompleteGiro;
  List<Giro> giros = [];
  Future<bool> getRequestGiro() async {
    final Uri url =
        Uri.parse("https://apiserviciostunv1.000webhostapp.com/api/giros");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = giroDataFromJson(response.body);
      giros = result.data;
      return true;
    } else {
      return false;
    }
  }

  List<String> autoCompleteSucursal;
  List<Sucursal> sucursales = [];
  Future<bool> getRequestSucursal() async {
    final Uri url =
        Uri.parse("https://apiserviciostunv1.000webhostapp.com/api/sucursales");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = sucursalDataFromJson(response.body);
      sucursales = result.data;
      return true;
    } else {
      return false;
    }
  }

  Future fetchAutoCompleteSegmento() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteSegmento = jsonStringData;
    });
  }

  Future fetchAutoCompleteGiro() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteGiro = jsonStringData;
    });
  }

  Future fetchAutoCompleteSucursal() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteSucursal = jsonStringData;
    });
  }

  Cliente _cliente;
  final _nombre = TextEditingController();
  final _razon = TextEditingController();
  final _rfc = TextEditingController();
  final _email = TextEditingController();
  final _calle = TextEditingController();
  final _exterior = TextEditingController();
  final _interior = TextEditingController();
  final _ecalle = TextEditingController();
  final _ycalle = TextEditingController();
  final _colonia = TextEditingController();
  final _postal = TextEditingController();
  final _ciudad = TextEditingController();
  final _estado = TextEditingController();
  final _pais = TextEditingController();
  final _particular = TextEditingController();
  final _oficina = TextEditingController();
  final _movil = TextEditingController();
  final _limiteCredito = TextEditingController();
  final _diasCredito = TextEditingController();
  final _diasBloqueo = TextEditingController();
  final _descuento = TextEditingController();
  final _day = TextEditingController();
  final _month = TextEditingController();
  final _year = TextEditingController();
  TextEditingController _sucursalId;
  TextEditingController _segmentoId;
  TextEditingController _giroId;

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteSegmento();
    fetchAutoCompleteGiro();
    fetchAutoCompleteSucursal();
    getRequestSegmentos();
    getRequestGiro();
    getRequestSucursal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(centerTitle: true, title: Text('Registro de cliente')),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Información Personal",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextField(
                      controller: _nombre,
                      decoration: InputDecoration(
                        labelText: 'Nombre completo',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      controller: _razon,
                      decoration: InputDecoration(
                        labelText: 'Razón social',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      controller: _rfc,
                      decoration: InputDecoration(
                        labelText: 'RFC',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Fecha de cumpleaños",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _year,
                      decoration: InputDecoration(
                        labelText: 'Año Ej: 2021',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _month,
                      decoration: InputDecoration(
                        labelText: 'Mes Ej: 09',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _day,
                      decoration: InputDecoration(
                        labelText: 'Día Ej: 05',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Dirección",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextField(
                      controller: _calle,
                      decoration: InputDecoration(
                        labelText: 'Calle',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      controller: _exterior,
                      decoration: InputDecoration(
                        labelText: 'No. Exterior',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      controller: _interior,
                      decoration: InputDecoration(
                        labelText: 'No. Interior',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      controller: _ecalle,
                      decoration: InputDecoration(
                        labelText: 'Entre calle',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      controller: _ycalle,
                      decoration: InputDecoration(
                        labelText: 'Y la calle',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      controller: _colonia,
                      decoration: InputDecoration(
                        labelText: 'Colonia',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      controller: _postal,
                      decoration: InputDecoration(
                        labelText: 'C. Postal',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      controller: _ciudad,
                      decoration: InputDecoration(
                        labelText: 'Ciudad',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      controller: _estado,
                      decoration: InputDecoration(
                        labelText: 'Estado',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      controller: _pais,
                      decoration: InputDecoration(
                        labelText: 'País',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Teléfonos",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _particular,
                      decoration: InputDecoration(
                        labelText: 'Particular',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _oficina,
                      decoration: InputDecoration(
                        labelText: 'Oficina',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _movil,
                      decoration: InputDecoration(
                        labelText: 'Móvil',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Datos de la empresa",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
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
                          return autoCompleteSucursal.where((word) => word
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
                              final sucursal = sucursales[index];
                              return ListTile(
                                //title: Text(option.toString()),
                                title: SubstringHighlight(
                                  text: sucursal.descripcion,
                                  term: _sucursalId.text,
                                  textStyleHighlight:
                                      TextStyle(fontWeight: FontWeight.w700),
                                ),
                                subtitle: SubstringHighlight(
                                  text: sucursal.empresa,
                                  term: _sucursalId.text,
                                  textStyleHighlight:
                                      TextStyle(fontWeight: FontWeight.w700),
                                ),
                                onTap: () {
                                  onSelected(sucursal.id.toString());
                                },
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: sucursales.length,
                          ),
                        );
                      },
                      onSelected: (selectedString) {
                        print(selectedString);
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
                        this._sucursalId = controller;

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
                            hintText: "Seleccione la sucursal",
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
                          return autoCompleteSegmento.where((word) => word
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
                              final segmento = segmentos[index];
                              return ListTile(
                                //title: Text(option.toString()),
                                title: SubstringHighlight(
                                  text: segmento.descripcion,
                                  term: _segmentoId.text,
                                  textStyleHighlight:
                                      TextStyle(fontWeight: FontWeight.w700),
                                ),
                                //subtitle: Text("Esto es un subtitulo"),
                                onTap: () {
                                  onSelected(segmento.id.toString());
                                },
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: segmentos.length,
                          ),
                        );
                      },
                      onSelected: (selectedString) {
                        print(selectedString);
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
                        this._segmentoId = controller;

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
                            hintText: "Seleccione el segmento",
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
                          return autoCompleteGiro.where((word) => word
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
                              final giro = giros[index];
                              return ListTile(
                                //title: Text(option.toString()),
                                title: SubstringHighlight(
                                  text: giro.descripcion,
                                  term: _giroId.text,
                                  textStyleHighlight:
                                      TextStyle(fontWeight: FontWeight.w700),
                                ),
                                onTap: () {
                                  onSelected(giro.id.toString());
                                },
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: giros.length,
                          ),
                        );
                      },
                      onSelected: (selectedString) {
                        print(selectedString);
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
                        this._giroId = controller;

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
                            hintText: "Seleccione el giro comercial",
                            prefixIcon: Icon(Icons.search),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Crédito",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _limiteCredito,
                      decoration: InputDecoration(
                        labelText: 'Límite de crédito',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _diasCredito,
                      decoration: InputDecoration(
                        labelText: 'Días de crédito',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _diasBloqueo,
                      decoration: InputDecoration(
                        labelText: 'Días bloqueo',
                        prefixIcon: Icon(Icons.arrow_right_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      controller: _descuento,
                      decoration: InputDecoration(
                        enabled: false,
                        labelText: 'Sin descuento',
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
            final nombre = _nombre.text;
            final razon = _razon.text;
            final rfc = _rfc.text;
            final email = _email.text;
            final calle = _calle.text;
            final exterior = _exterior.text;
            final interior = _interior.text;
            final ecalle = _ecalle.text;
            final ycalle = _ycalle.text;
            final colonia = _colonia.text;
            final postal = _postal.text;
            final ciudad = _ciudad.text;
            final estado = _estado.text;
            final pais = _pais.text;
            final particular = _particular.text;
            final oficina = _oficina.text;
            final movil = _movil.text;
            final limitecredito = double.parse(_limiteCredito.text);
            final diascredito = int.parse(_diasCredito.text);
            final diasbloqueo = int.parse(_diasBloqueo.text);
            final descuento = "Sin descuento";
            final date = _year.text +
                "-" +
                _month.text +
                "-" +
                _day.text +
                " " +
                "00:00:00";
            final birthday = DateTime.parse(date);
            final sucursalId = int.parse(_sucursalId.text);
            final segmentoId = int.parse(_segmentoId.text);
            final giroId = int.parse(_giroId.text);

            final Cliente cliente = await createCliente(
                nombre,
                razon,
                rfc,
                email,
                calle,
                exterior,
                interior,
                ecalle,
                ycalle,
                colonia,
                postal,
                ciudad,
                estado,
                pais,
                particular,
                oficina,
                movil,
                limitecredito,
                diascredito,
                diasbloqueo,
                descuento,
                birthday,
                sucursalId,
                segmentoId,
                giroId);
            setState(() {
              _cliente = cliente;
            });
            if (_cliente == null) {
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
