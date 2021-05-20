import 'package:flutter/material.dart';

class OrdenForm extends StatelessWidget {
  const OrdenForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
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
    ]));
  }
}
