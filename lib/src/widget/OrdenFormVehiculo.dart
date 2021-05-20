import 'package:flutter/material.dart';

class OrdenFormVehiculo extends StatefulWidget {
  const OrdenFormVehiculo({
    Key key,
  }) : super(key: key);

  @override
  _OrdenFormVehiculoState createState() => _OrdenFormVehiculoState();
}

class _OrdenFormVehiculoState extends State<OrdenFormVehiculo> {
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
    return new Container(
        child: new Column(children: <Widget>[
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
      )
    ]));
  }
}
