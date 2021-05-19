import 'package:flutter/material.dart';

class NombreForm extends StatelessWidget {
  const NombreForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
      Text(
        "Información Personal",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Nombre completo',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Razón social',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'RFC',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Cumpleaños',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
    ]));
  }
}
