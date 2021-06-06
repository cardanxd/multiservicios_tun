import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiservicios_tun/models/Cliente.dart';

class ClienteForm extends StatefulWidget {
  const ClienteForm({
    Key key,
  }) : super(key: key);

  @override
  _ClienteFormState createState() => _ClienteFormState();
}

class _ClienteFormState extends State<ClienteForm> {
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _razon = TextEditingController();
  final TextEditingController _rfc = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _calle = TextEditingController();
  final TextEditingController _exterior = TextEditingController();
  final TextEditingController _interior = TextEditingController();
  final TextEditingController _ecalle = TextEditingController();
  final TextEditingController _ycalle = TextEditingController();
  final TextEditingController _colonia = TextEditingController();
  final TextEditingController _postal = TextEditingController();
  final TextEditingController _ciudad = TextEditingController();
  final TextEditingController _estado = TextEditingController();
  final TextEditingController _pais = TextEditingController();
  final TextEditingController _particular = TextEditingController();
  final TextEditingController _oficina = TextEditingController();
  final TextEditingController _movil = TextEditingController();
  final TextEditingController _limiteCredito = TextEditingController();
  final TextEditingController _diasCredito = TextEditingController();
  final TextEditingController _diasBloqueo = TextEditingController();
  final TextEditingController _descuento = TextEditingController();
  final TextEditingController _birthday = TextEditingController();
  final TextEditingController _sucursal = TextEditingController();
  final TextEditingController _segmento = TextEditingController();
  final TextEditingController _giro = TextEditingController();

  Future<Cliente> _futureCliente;

  Future<Cliente> crearCliente(
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
      double limiteCredito,
      int diasCredito,
      int diasBloqueo,
      String descuento,
      DateTime birthday,
      int sucursal,
      int segmento,
      int giro) async {
    final response = await http.post(
      Uri.parse('https://apiserviciostunv1.000webhostapp.com/api/clientes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'nombre': nombre,
        'razon': razon,
        'rfc': rfc,
        'email': email,
        'calle': calle,
        'exterior': exterior,
        'interior': interior,
        'ecalle': ecalle,
        'ycalle': ycalle,
        'colonia': colonia,
        'postal': postal,
        'ciudad': ciudad,
        'estado': estado,
        'pais': pais,
        'particular': particular,
        'oficina': oficina,
        'movil': movil,
        'limitecredito': limiteCredito,
        'diascredito': diasCredito,
        'diasbloqueo': diasBloqueo,
        'descuento': descuento,
        'birthday': birthday,
        'sucursal': sucursal,
        'segmento': segmento,
        'giro': giro,
      }),
    );

    if (response.statusCode == 201) {
      return Cliente.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Fallo al crear el cliente.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
      Text(
        "Información Personal",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _nombre,
        decoration: InputDecoration(
          labelText: 'Nombre completo',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _razon,
        decoration: InputDecoration(
          labelText: 'Razón social',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _rfc,
        decoration: InputDecoration(
          labelText: 'RFC',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.emailAddress,
        controller: _email,
        decoration: InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
      TextField(
        keyboardType: TextInputType.datetime,
        controller: _birthday,
        decoration: InputDecoration(
          labelText: 'Cumpleaños',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
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
        keyboardType: TextInputType.text,
        controller: _calle,
        decoration: InputDecoration(
          labelText: 'Calle',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _exterior,
        decoration: InputDecoration(
          labelText: 'No. Exterior',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _interior,
        decoration: InputDecoration(
          labelText: 'No. Interior',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _ecalle,
        decoration: InputDecoration(
          labelText: 'Entre calle',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _ycalle,
        decoration: InputDecoration(
          labelText: 'Y la calle',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _colonia,
        decoration: InputDecoration(
          labelText: 'Colonia',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _postal,
        decoration: InputDecoration(
          labelText: 'C. Postal',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _ciudad,
        decoration: InputDecoration(
          labelText: 'Ciudad',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _estado,
        decoration: InputDecoration(
          labelText: 'Estado',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: _pais,
        decoration: InputDecoration(
          labelText: 'País',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
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
        //controller: myControllernum2,
      ),
      TextField(
        keyboardType: TextInputType.number,
        controller: _oficina,
        decoration: InputDecoration(
          labelText: 'Oficina',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
      TextField(
        keyboardType: TextInputType.number,
        controller: _movil,
        decoration: InputDecoration(
          labelText: 'Móvil',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
      SizedBox(
        height: 16.0,
      ),
      Text(
        "Sucursal",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      TextField(
        keyboardType: TextInputType.number,
        controller: _sucursal,
        decoration: InputDecoration(
          labelText: 'Sucursal',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.number,
        controller: _segmento,
        decoration: InputDecoration(
          labelText: 'Segmento',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.number,
        controller: _giro,
        decoration: InputDecoration(
          labelText: 'Giro comercial',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
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
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.number,
        controller: _diasCredito,
        decoration: InputDecoration(
          labelText: 'Días de crédito',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.number,
        controller: _diasBloqueo,
        decoration: InputDecoration(
          labelText: 'Días bloqueo',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      SizedBox(
        height: 16.0,
      ),
      Text(
        "Descuento",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      TextField(
        keyboardType: TextInputType.number,
        controller: _descuento,
        decoration: InputDecoration(
          labelText: 'Descuento',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      SizedBox(
        height: 16,
      ),
      MaterialButton(
        minWidth: 200.0,
        height: 40.0,
        onPressed: () {
          setState(() {
            _futureCliente = crearCliente(
                _nombre.text,
                _razon.text,
                _rfc.text,
                _email.text,
                _calle.text,
                _exterior.text,
                _interior.text,
                _ecalle.text,
                _ycalle.text,
                _colonia.text,
                _postal.text,
                _ciudad.text,
                _estado.text,
                _pais.text,
                _particular.text,
                _oficina.text,
                _movil.text,
                double.parse(_limiteCredito.text),
                _diasCredito.hashCode,
                _diasBloqueo.hashCode,
                _descuento.text,
                DateTime.parse(_birthday.text),
                _sucursal.hashCode,
                _segmento.hashCode,
                _giro.hashCode);
          });
        },
        color: Colors.indigo,
        child: Text('Registrar cliente', style: TextStyle(color: Colors.white)),
      ),
      SizedBox(
        height: 20.0,
      ),
      MaterialButton(
        minWidth: 200.0,
        height: 40.0,
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.indigo,
        child: Text('Cancelar', style: TextStyle(color: Colors.white)),
      )
    ]));
  }
}
