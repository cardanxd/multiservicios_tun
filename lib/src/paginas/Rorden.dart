import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:multiservicios_tun/models/Orden.dart';

class Rorden extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RordenState();
}

Future<Orden> crearOrden(
    DateTime fecha,
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
    double combustible,
    String transmision,
    String vestiduras) async {
  final String url = "https://apiserviciostunv1.000webhostapp.com/api/ordenes";
  final response = await http.post(Uri.parse(url), body: {
    "fecha":
        "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
    "vendedor": vendedor,
    "cliente": cliente,
    "vehiculo": vehiculo,
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
    "km": km,
    "combustible": combustible,
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
  DateTime now = new DateTime.now();
  Orden _orden;
  String placas = 'False';
  String ceniceros = 'False';
  String cristalesrotos = 'False';
  String quemacocos = 'False';
  String espejoizq = 'False';
  String espejoder = 'False';
  String espejosint = 'False';
  String tapon = 'False';
  String antena = 'False';
  String tapetes = 'False';
  String varilla = 'False';
  String reloj = 'False';
  String manija = 'False';
  String radio = 'False';
  String gato = 'False';
  String extinguidor = 'False';
  String emblemas = 'False';
  String encendedor = 'False';
  String llanta = 'False';
  String valueveinte = 'False';

  final _fecha = TextEditingController();
  final _vendedor = TextEditingController();
  final _cliente = TextEditingController();
  final _vehiculo = TextEditingController();
  final _cilindros = TextEditingController();
  final _condicionventa = TextEditingController();
  final _urgenciainicial = TextEditingController();
  final _atencion = TextEditingController();
  final _comentarios = TextEditingController();
  final _centrocosto = TextEditingController();
  final _placa = TextEditingController();
  final _ceniceros = TextEditingController();
  final _cristalesrotos = TextEditingController();
  final _quemacocos = TextEditingController();
  final _espejoizq = TextEditingController();
  final _espejoder = TextEditingController();
  final _tapon = TextEditingController();
  final _antena = TextEditingController();
  final _tapetes = TextEditingController();
  final _varilla = TextEditingController();
  final _radio = TextEditingController();
  final _espejoint = TextEditingController();
  final _gato = TextEditingController();
  final _extinguidor = TextEditingController();
  final _emblemas = TextEditingController();
  final _encendedor = TextEditingController();
  final _llanta = TextEditingController();
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
                  enabled: false,
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
                keyboardType: TextInputType.text,
                controller: _vehiculo,
                decoration: InputDecoration(
                  enabled: false,
                  labelText: 'Placas',
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
              TextField(
                keyboardType: TextInputType.text,
                controller: _urgenciainicial,
                decoration: InputDecoration(
                  labelText: 'Urgencia Inicial',
                  prefixIcon: Icon(Icons.arrow_right_outlined),
                ),
                //controller: myControllernum2,
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
                items: <String>['False', 'True']
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
            final fecha = DateTime.parse(_fecha.text);
            final vendedor = _vendedor.text;
            final cliente = int.parse(_cliente.text);
            final vehiculo = int.parse(_vehiculo.text);
            final cilindros = _cilindros.text;
            final condicionventa = _condicionventa.text;
            final urgenciainicial = _urgenciainicial.text;
            final atencion = _atencion.text;
            final comentarios = _comentarios.text;
            final centrocosto = _centrocosto.text;
            final placa = _placa.text;
            final ceniceros = _ceniceros.text;
            final cristalesRotos = _cristalesrotos.text;
            final quemacocos = _quemacocos.text;
            final espejoIzq = _espejoizq.text;
            final espejoDer = _espejoder.text;
            final tapon = _tapon.text;
            final antena = _antena.text;
            final tapetes = _tapetes.text;
            final varilla = _varilla.text;
            final radio = _radio.text;
            final espejoInt = _espejoint.text;
            final gato = _gato.text;
            final extinguidor = _extinguidor.text;
            final emblemas = _emblemas.text;
            final encendedor = _encendedor.text;
            final llanta = _llanta.text;
            final km = double.parse(_km.text);
            final combustible = double.parse(_combustible.text);
            final transmision = _transmision.text;
            final vestiduras = _vestiduras.text;

            final Orden orden = await crearOrden(
                fecha,
                vendedor,
                cliente,
                vehiculo,
                cilindros,
                condicionventa,
                urgenciainicial,
                atencion,
                comentarios,
                centrocosto,
                placa,
                ceniceros,
                cristalesRotos,
                quemacocos,
                espejoIzq,
                espejoDer,
                tapon,
                antena,
                tapetes,
                varilla,
                radio,
                espejoInt,
                gato,
                extinguidor,
                emblemas,
                encendedor,
                llanta,
                km,
                combustible,
                transmision,
                vestiduras);
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
