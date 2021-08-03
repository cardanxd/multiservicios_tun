import 'dart:math';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:multiservicios_tun/models/Cliente.dart';

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
    DateTime birthday) async {
  final Uri url =
      Uri.parse("https://apiserviciostunv1.000webhostapp.com/api/clientes");
  final response = await http.post(url, body: {
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
    "birthday": birthday.toIso8601String(),
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
  Random random = new Random();
  bool isValid;
  DateTime now = DateTime.now();
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
  final _day = TextEditingController();
  final _month = TextEditingController();
  final _year = TextEditingController();

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
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _nombre,
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
                      labelText: "Nombre completo",
                      helperText: "Campo obligatorio",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _razon,
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
                      labelText: "Razón social",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _rfc,
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
                      labelText: "RFC",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
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
                      labelText: "Correo electrónico",
                      helperText: "Campo obligatorio",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                    onChanged: (value) {
                      isValid = EmailValidator.validate(value);
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Fecha de cumpleaños",
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
                    controller: _year,
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
                      labelText: "Seleccione el año",
                      helperText: "Cuatro dígitos",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _month,
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
                      labelText: "Seleccione el mes",
                      helperText: "Dos dígitos",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _day,
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
                      labelText: "Seleccione el día",
                      helperText: "Dos dígitos",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Dirección",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _calle,
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
                      labelText: "Calle",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _exterior,
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
                      labelText: "Número exterior",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _interior,
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
                      labelText: "Número interior",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _ecalle,
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
                      labelText: "Entre calle",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _ycalle,
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
                      labelText: "Y la calle",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _colonia,
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
                      labelText: "Colonia",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _postal,
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
                      labelText: "Código postal",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _ciudad,
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
                      labelText: "Ciudad",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _estado,
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
                      labelText: "Estado",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _pais,
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
                      labelText: "País",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Teléfonos",
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
                    controller: _particular,
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
                      labelText: "Número particular",
                      helperText: "Campo obligatorio",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _oficina,
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
                      labelText: "Número de oficina",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _movil,
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
                      labelText: "Número móvil",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text('Registrar cliente',
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
                      Fluttertoast.showToast(msg: "Registro en proceso");

                      int randomNumber = random.nextInt(1000000);

                      String nombre;
                      if (_nombre.text.isEmpty) {
                        setState(() {
                          isLoading = false;
                          _showAlertError(context,
                              'El campo nombre es obligatorio, por favor escriba el nombre');
                        });
                      } else {
                        nombre = _nombre.text;
                      }
                      String razon;
                      if (_razon.text.isEmpty) {
                        razon = "Sin razón social";
                      } else {
                        razon = _razon.text;
                      }
                      String rfc;
                      if (_rfc.text.isEmpty) {
                        rfc = "Sin RFC - Folio $randomNumber";
                      } else {
                        rfc = _rfc.text;
                      }
                      String email;
                      if (_email.text.isEmpty) {
                        setState(() {
                          isLoading = false;
                          _showAlertError(context,
                              'El campo email es obligatorio, por favor escriba el email');
                        });
                      } else {
                        if (isValid == false) {
                          setState(() {
                            isLoading = false;
                            _showAlertError(context,
                                'El campo email es inválido, por favor escriba correctamente el email');
                          });
                        } else {
                          email = _email.text;
                        }
                      }

                      String calle;
                      if (_calle.text.isEmpty) {
                        calle = "NA";
                      } else {
                        calle = _calle.text;
                      }
                      String exterior;
                      if (_exterior.text.isEmpty) {
                        exterior = "NA";
                      } else {
                        exterior = _exterior.text;
                      }
                      String interior;
                      if (_interior.text.isEmpty) {
                        interior = "NA";
                      } else {
                        interior = _interior.text;
                      }
                      String ecalle;
                      if (_ecalle.text.isEmpty) {
                        ecalle = "NA";
                      } else {
                        ecalle = _ecalle.text;
                      }
                      String ycalle;
                      if (_ycalle.text.isEmpty) {
                        ycalle = "NA";
                      } else {
                        ycalle = _ycalle.text;
                      }
                      String colonia;
                      if (_colonia.text.isEmpty) {
                        colonia = "NA";
                      } else {
                        colonia = _colonia.text;
                      }
                      String postal;
                      if (_postal.text.isEmpty) {
                        postal = "NA";
                      } else {
                        postal = _postal.text;
                      }
                      String ciudad;
                      if (_ciudad.text.isEmpty) {
                        ciudad = "NA";
                      } else {
                        ciudad = _ciudad.text;
                      }
                      String estado;
                      if (_estado.text.isEmpty) {
                        estado = "NA";
                      } else {
                        estado = _estado.text;
                      }
                      String pais;
                      if (_pais.text.isEmpty) {
                        pais = "México";
                      } else {
                        pais = _pais.text;
                      }
                      String particular;
                      if (_particular.text.isEmpty) {
                        setState(() {
                          isLoading = false;
                          _showAlertError(context,
                              'El campo número particular es obligatorio, por favor escriba el número particular');
                        });
                      } else {
                        particular = _particular.text;
                      }
                      String oficina;
                      if (_oficina.text.isEmpty) {
                        oficina = "Sin número - Folio $randomNumber";
                      } else {
                        oficina = _oficina.text;
                      }
                      String movil;
                      if (_movil.text.isEmpty) {
                        movil = "Sin número - Folio $randomNumber";
                      } else {
                        movil = _movil.text;
                      }

                      String date;
                      if (_year.text.isEmpty ||
                          _month.text.isEmpty ||
                          _day.text.isEmpty) {
                        date = now.toIso8601String();
                      } else {
                        String year;
                        if (_year.text.length < 4 || _year.text.length > 4) {
                          setState(() {
                            isLoading = false;
                            _showAlertError(
                                context, 'El año debe tener cuatro dígitos');
                          });
                        } else {
                          year = _year.text;
                        }
                        String month;
                        if (_month.text.length < 2 || _month.text.length > 2) {
                          setState(() {
                            isLoading = false;
                            _showAlertError(
                                context, 'El mes debe tener dos digitos');
                          });
                        } else {
                          month = _month.text;
                        }
                        String day;
                        if (_day.text.length < 2 || _day.text.length > 2) {
                          setState(() {
                            isLoading = false;
                            _showAlertError(
                                context, 'El día debe tener dos digitos');
                          });
                        } else {
                          day = _day.text;
                        }
                        date =
                            year + "-" + month + "-" + day + " " + "00:00:00";
                      }

                      final birthday = DateTime.parse(date);

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
                          birthday);
                      setState(() {
                        _cliente = cliente;
                      });
                      if (_cliente == null) {
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
    );
  }
}

void _showAlertError(BuildContext context, String msg) {
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
