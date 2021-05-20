import 'package:flutter/material.dart';

class InfoClienteOrden extends StatelessWidget {
  const InfoClienteOrden({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
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
    ]));
  }
}
