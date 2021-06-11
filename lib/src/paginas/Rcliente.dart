import 'package:flutter/material.dart';
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
    double limitecredito,
    int diascredito,
    int diasbloqueo,
    String descuento,
    DateTime birthday,
    int sucursal,
    int segmento,
    int giro) async {
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
    "birthday": birthday.toString(),
    "sucursal": sucursal.toString(),
    "segmento": segmento.toString(),
    "giro": giro.toString()
  });
  if (response.statusCode == 201) {
    final String responseString = response.body;
    return clienteFromJson(responseString);
  } else {
    return null;
  }
}

class _RclienteState extends State<Rcliente> {
  Cliente _cliente;
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
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _birthday.text = date;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text('Multiservicios Tun')),
      body: Padding(
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
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _birthday,
                  decoration: InputDecoration(
                    labelText: "Cumpleaños",
                    prefixIcon: Icon(Icons.arrow_right_outlined),
                  ),
                  validator: (value) {
                    if (value.isEmpty)
                      return "Por favor selecciona la fecha de cumpleaños";
                    return null;
                  },
                ),
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
            _cliente == null
                ? Container()
                : Text(
                    "El cliente ${_cliente.nombre} fue creado satisfactoriamente")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String nombre = _nombre.text;
          final String razon = _razon.text;
          final String rfc = _rfc.text;
          final String email = _email.text;
          final String calle = _calle.text;
          final String exterior = _exterior.text;
          final String interior = _interior.text;
          final String ecalle = _ecalle.text;
          final String ycalle = _ycalle.text;
          final String colonia = _colonia.text;
          final String postal = _postal.text;
          final String ciudad = _ciudad.text;
          final String estado = _estado.text;
          final String pais = _pais.text;
          final String particular = _particular.text;
          final String oficina = _oficina.text;
          final String movil = _movil.text;
          final double limitecredito = double.parse(_limiteCredito.text);
          final int diascredito = int.parse(_diasCredito.text);
          final int diasbloqueo = int.parse(_diasBloqueo.text);
          final String descuento = _descuento.text;
          final DateTime birthday = DateTime.parse(_birthday.text);
          final int sucursal = int.parse(_diasBloqueo.text);
          final int segmento = int.parse(_segmento.text);
          final int giro = int.parse(_giro.text);

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
              sucursal,
              segmento,
              giro);
          setState(() {
            _cliente = cliente;
          });
        },
        tooltip: 'Registrar',
        child: Icon(Icons.add),
      ),
    );
  }
}
