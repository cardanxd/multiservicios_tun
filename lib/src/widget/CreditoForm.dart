import 'package:flutter/material.dart';

class CreditoForm extends StatelessWidget {
  const CreditoForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
      Text(
        "Crédito",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Límite de crédito',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Días de crédito',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.number,
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
        decoration: InputDecoration(
          labelText: 'Descuento',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
    ]));
  }
}
