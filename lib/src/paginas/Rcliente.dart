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
                  TextField(
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
                      hintText: "Nombre completo",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Razón social",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "RFC",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Correo electrónico",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
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
                  TextField(
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
                      hintText: "Seleccione el año (2021)",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Seleccione el mes (05)",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Seleccione el día (04)",
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
                  TextField(
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
                      hintText: "Calle",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Número exterior",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Número interior",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Entre calle",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Y la calle",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Colonia",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Código postal",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Ciudad",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Estado",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "País",
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
                  TextField(
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
                      hintText: "Número particular",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Número de oficina",
                      prefixIcon: Icon(Icons.arrow_right_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
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
                      hintText: "Número móvil",
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
                      final date = _year.text +
                          "-" +
                          _month.text +
                          "-" +
                          _day.text +
                          " " +
                          "00:00:00";
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
                        _showAlertError(context);
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
