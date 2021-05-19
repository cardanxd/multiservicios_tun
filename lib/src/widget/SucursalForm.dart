import 'package:flutter/material.dart';

class SucursalForm extends StatelessWidget {
  const SucursalForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
      Text(
        "Sucursal",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Sucursal',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Segmento',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Giro comercial',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
    ]));
  }
}
