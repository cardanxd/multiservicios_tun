import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:animated_text_kit/animated_text_kit.dart';
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
    "birthday": birthday.toIso8601String(),
    "sucursal": sucursal.toString(),
    "segmento": segmento.toString(),
    "giro": giro.toString(),
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
  final _birthday = TextEditingController();
  final _sucursal = TextEditingController();
  final _segmento = TextEditingController();
  final _giro = TextEditingController();

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
                controller: _nombre,
                decoration: InputDecoration(
                  labelText: 'Nombre completo',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myController,
              ),
              TextField(
                controller: _razon,
                decoration: InputDecoration(
                  labelText: 'Razón social',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myController,
              ),
              TextField(
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
                controller: _birthday,
                decoration: InputDecoration(
                  labelText: 'Cumpleaños',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
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
                //controller: myController,
              ),
              TextField(
                controller: _exterior,
                decoration: InputDecoration(
                  labelText: 'No. Exterior',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myController,
              ),
              TextField(
                controller: _interior,
                decoration: InputDecoration(
                  labelText: 'No. Interior',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myController,
              ),
              TextField(
                controller: _ecalle,
                decoration: InputDecoration(
                  labelText: 'Entre calle',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myController,
              ),
              TextField(
                controller: _ycalle,
                decoration: InputDecoration(
                  labelText: 'Y la calle',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myController,
              ),
              TextField(
                controller: _colonia,
                decoration: InputDecoration(
                  labelText: 'Colonia',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myController,
              ),
              TextField(
                controller: _postal,
                decoration: InputDecoration(
                  labelText: 'C. Postal',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myController,
              ),
              TextField(
                controller: _ciudad,
                decoration: InputDecoration(
                  labelText: 'Ciudad',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myController,
              ),
              TextField(
                controller: _estado,
                decoration: InputDecoration(
                  labelText: 'Estado',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myController,
              ),
              TextField(
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
                "Datos de la empresa",
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
                  : ElevatedButton(
                      child: DefaultTextStyle(
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          child: AnimatedTextKit(animatedTexts: [
                            TypewriterAnimatedText('Aceptar y continuar')
                          ], isRepeatingAnimation: true, totalRepeatCount: 2)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.grey[900],
                        shadowColor: Colors.black,
                        elevation: 10,
                        minimumSize: Size(150, 40),
                        alignment: Alignment.center,
                        shape: StadiumBorder(),
                        side: BorderSide(color: Colors.indigo[600], width: 2),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
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
            final descuento = _descuento.text;
            final birthday = DateTime.parse(_birthday.text);
            final sucursal = int.parse(_sucursal.text);
            final segmento = int.parse(_segmento.text);
            final giro = int.parse(_giro.text);

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
          backgroundColor: Colors.indigo,
          label: const Text('Registrar'),
          icon: const Icon(Icons.thumb_up),
        ));
  }
}
