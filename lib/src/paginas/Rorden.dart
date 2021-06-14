import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:multiservicios_tun/models/Orden.dart';

class Rorden extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RordenState();
}

Future<Orden> crearOrden(
  String vendedor,
  int cliente,
  int vehiculo,
  String cilindros,
  String condicionventa,
  String urgenciainicial,
  String atencion,
  String comentarios,
  String centrocosto,
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
  int combustible,
  String transmision,
  String vestiduras,
  DateTime createdAt,
) async {
  final String url = "https://apiserviciostunv1.000webhostapp.com/api/ordenes";
  final response = await http.post(Uri.parse(url), body: {
    "vendedor": vendedor,
    "cliente": cliente.toString(),
    "vehiculo": vehiculo.toString(),
    "cilindros": cilindros,
    "condicionventa": condicionventa,
    "urgenciainicial": urgenciainicial,
    "atencion": atencion,
    "comentarios": comentarios,
    "centrocosto": centrocosto,
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
    "created_at": createdAt.toIso8601String(),
  });
  if (response.statusCode == 201) {
    return ordenFromJson(response.body);
  } else {
    return null;
  }
}

class _RordenState extends State<Rorden> {
  DateTime now = new DateTime.now();
  Orden _orden;
  String urgenciainicial = 'baja';
  String placas = 'false';
  String ceniceros = 'false';
  String cristalesrotos = 'false';
  String quemacocos = 'false';
  String espejoizq = 'false';
  String espejoder = 'false';
  String espejosint = 'false';
  String tapon = 'false';
  String antena = 'false';
  String tapetes = 'false';
  String varilla = 'false';
  String reloj = 'false';
  String manija = 'false';
  String radio = 'false';
  String gato = 'false';
  String extinguidor = 'false';
  String emblemas = 'false';
  String encendedor = 'false';
  String llanta = 'false';

  final _fecha = TextEditingController();
  final _vendedor = TextEditingController();
  final _cliente = TextEditingController();
  final _vehiculo = TextEditingController();
  final _cilindros = TextEditingController();
  final _condicionventa = TextEditingController();
  final _atencion = TextEditingController();
  final _comentarios = TextEditingController();
  final _centrocosto = TextEditingController();
  final _km = TextEditingController();
  final _combustible = TextEditingController();
  final _transmision = TextEditingController();
  final _vestiduras = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.indigo,
            title: Text('Multiservicios Tun')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Text(
                "Fecha:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _fecha,
                decoration: InputDecoration(
                  enabled: false,
                  labelText: '$now',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myController,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Vendedor:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _vendedor,
                decoration: InputDecoration(
                  labelText: 'Nombre del vendedor',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Cliente:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _cliente,
                decoration: InputDecoration(
                  labelText: 'Nombre del cliente',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Info. Vehiculo:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _vehiculo,
                decoration: InputDecoration(
                  labelText: 'Vehiculo',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _cilindros,
                decoration: InputDecoration(
                  labelText: 'Cilindros',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Condicion Venta:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _condicionventa,
                decoration: InputDecoration(
                  labelText: 'Condicion venta',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Urgencia Inicial:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: urgenciainicial,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    urgenciainicial = newValue;
                  });
                },
                items: <String>['baja', 'media', 'alta']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10.0,
              ),
              //Nombre del chofer
              Text(
                "Atencion:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _atencion,
                decoration: InputDecoration(
                  labelText: 'Atencion',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Comentarios:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _comentarios,
                decoration: InputDecoration(
                  labelText: 'Comentarios',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Centro Costo:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _centrocosto,
                decoration: InputDecoration(
                  labelText: 'Centro costo',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Inventario del vehiculo",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Placas",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: placas,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    placas = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Ceniceros",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: ceniceros,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    ceniceros = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Cristales rotos",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: cristalesrotos,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    cristalesrotos = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Quemacocos",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: quemacocos,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    quemacocos = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Espejo izquierdo",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: espejoizq,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    espejoizq = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Espejo derecho",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: espejoder,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    espejoder = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Espejo interior",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: espejosint,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    espejosint = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Tapon",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: tapon,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    tapon = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Antena",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: antena,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    antena = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Tapetes",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: tapetes,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    tapetes = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Varilla",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: varilla,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    varilla = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Reloj",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: reloj,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    reloj = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Manija",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: manija,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    manija = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Radio",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: radio,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    radio = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Gato",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: gato,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    gato = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Extinguidor",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: extinguidor,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    extinguidor = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Emblemas",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: emblemas,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    emblemas = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Encendedor",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: encendedor,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    encendedor = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Llanta",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              DropdownButton<String>(
                value: llanta,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    llanta = newValue;
                  });
                },
                items: <String>['false', 'true']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Estado del vehiculo",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _km,
                decoration: InputDecoration(
                  labelText: 'Kilometraje',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _combustible,
                decoration: InputDecoration(
                  labelText: 'Nivel de combustible',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _transmision,
                decoration: InputDecoration(
                  labelText: 'Transmisión',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _vestiduras,
                decoration: InputDecoration(
                  labelText: 'Vestiduras',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
              ),
              SizedBox(
                height: 20.0,
              ),
              _orden == null
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
            final vendedor = _vendedor.text;
            final cliente = int.parse(_cliente.text);
            final vehiculo = int.parse(_vehiculo.text);
            final cilindros = _cilindros.text;
            final condicionventa = _condicionventa.text;
            final urgenciainicial1 = urgenciainicial;
            final atencion = _atencion.text;
            final comentarios = _comentarios.text;
            final centrocosto = _centrocosto.text;
            final placa1 = placas;
            final ceniceros1 = ceniceros;
            final cristalesRotos1 = cristalesrotos;
            final quemacocos1 = quemacocos;
            final espejoIzq1 = espejoizq;
            final espejoDer1 = espejoder;
            final tapon1 = tapon;
            final antena1 = antena;
            final tapetes1 = tapetes;
            final varilla1 = varilla;
            final radio1 = radio;
            final espejoInt1 = espejosint;
            final gato1 = gato;
            final extinguidor1 = extinguidor;
            final emblemas1 = emblemas;
            final encendedor1 = encendedor;
            final llanta1 = llanta;
            final km = double.parse(_km.text);
            final combustible = int.parse(_combustible.text);
            final transmision = _transmision.text;
            final vestiduras = _vestiduras.text;
            final createdAt = DateTime.now();

            final Orden orden = await crearOrden(
                vendedor,
                cliente,
                vehiculo,
                cilindros,
                condicionventa,
                urgenciainicial1,
                atencion,
                comentarios,
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
                createdAt);
            setState(() {
              _orden = orden;
            });
          },
          tooltip: 'Registrar',
          backgroundColor: Colors.indigo,
          label: const Text('Registrar'),
          icon: const Icon(Icons.thumb_up),
        ));
  }
}
