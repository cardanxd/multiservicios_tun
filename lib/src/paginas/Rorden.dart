import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/paginas/panel.dart';

class Rorden extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RordenState();
}

class _RordenState extends State<Rorden> {
  DateTime now = new DateTime.now();
  bool valueuno = false;
  bool valuedos = false;
  bool valuetres = false;
  bool valuecuatro = false;
  bool valuecinco = false;
  bool valueseis = false;
  bool valuesiete = false;
  bool valueocho = false;
  bool valuenueve = false;
  bool valuediez = false;
  bool valueonce = false;
  bool valuedoce = false;
  bool valuetrece = false;
  bool valuecatorce = false;
  bool valuequince = false;
  bool valuediesciseis = false;
  bool valuediesiciete = false;
  bool valuediesciocho = false;
  bool valuediesinueve = false;
  bool valueveinte = false;

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
              decoration: InputDecoration(
                enabled: false,
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
              keyboardType: TextInputType.text,
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
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Placas',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Tipo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Modelo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Color',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Num. Serie',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Num. Economico',
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
              decoration: InputDecoration(
                labelText: 'Urgencia Inicial',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Atencion:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
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
              decoration: InputDecoration(
                labelText: 'Centro costo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Cilindros:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cilindros',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Inventario del vehiculo",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Placas'),
              value: this.valueuno,
              onChanged: (bool value) {
                setState(() {
                  this.valueuno = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Ceniceros'),
              value: this.valuedos,
              onChanged: (bool value) {
                setState(() {
                  this.valuedos = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Cristales rotos'),
              value: this.valuetres,
              onChanged: (bool value) {
                setState(() {
                  this.valuetres = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Quemacocos (Func)'),
              value: this.valuecuatro,
              onChanged: (bool value) {
                setState(() {
                  this.valuecuatro = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Espejo Lat. Izq.'),
              value: this.valuecinco,
              onChanged: (bool value) {
                setState(() {
                  this.valuecinco = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Espejo Lat. Der.'),
              value: this.valueseis,
              onChanged: (bool value) {
                setState(() {
                  this.valueseis = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Tapón de gasolina'),
              value: this.valuesiete,
              onChanged: (bool value) {
                setState(() {
                  this.valuesiete = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Tapones de rueda'),
              value: this.valueocho,
              onChanged: (bool value) {
                setState(() {
                  this.valueocho = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Antena de radio'),
              value: this.valuenueve,
              onChanged: (bool value) {
                setState(() {
                  this.valuenueve = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Tapetes completos'),
              value: this.valuediez,
              onChanged: (bool value) {
                setState(() {
                  this.valuediez = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Varilla de gato'),
              value: this.valueonce,
              onChanged: (bool value) {
                setState(() {
                  this.valueonce = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Reloj'),
              value: this.valuedoce,
              onChanged: (bool value) {
                setState(() {
                  this.valuedoce = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Manija de puerta'),
              value: this.valuetrece,
              onChanged: (bool value) {
                setState(() {
                  this.valuetrece = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Radio/Estereo'),
              value: this.valuecatorce,
              onChanged: (bool value) {
                setState(() {
                  this.valuecatorce = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Espejos interiores'),
              value: this.valuequince,
              onChanged: (bool value) {
                setState(() {
                  this.valuequince = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Gato hidraulico'),
              value: this.valuediesciseis,
              onChanged: (bool value) {
                setState(() {
                  this.valuediesciseis = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Extinguidor'),
              value: this.valuediesiciete,
              onChanged: (bool value) {
                setState(() {
                  this.valuediesiciete = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Emblemas'),
              value: this.valuediesciocho,
              onChanged: (bool value) {
                setState(() {
                  this.valuediesciocho = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Encendedor'),
              value: this.valuediesinueve,
              onChanged: (bool value) {
                setState(() {
                  this.valuediesinueve = value;
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.double_arrow_outlined),
              title: const Text('Llanta de refacción'),
              value: this.valueveinte,
              onChanged: (bool value) {
                setState(() {
                  this.valueveinte = value;
                });
              },
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
              decoration: InputDecoration(
                labelText: 'Kilometraje',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nivel de combustible',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Transmisión',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Vestiduras',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10.0,
            ),
            MaterialButton(
              minWidth: 200.0,
              height: 40.0,
              onPressed: () {
                //Aqui van los metodos para el registro de orden
                //_mostrarAlerta(context);
                Navigator.pop(context);
              },
              color: Colors.indigo,
              child: Text('Registrar orden',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

void _mostrarAlerta(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => new AlertDialog(
            title: Text("Aviso de confirmación"),
            content: Text("¡Registro exitosamente!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Panel()),
                    );
                  },
                  child: Text("Aceptar"))
            ],
          ));
}