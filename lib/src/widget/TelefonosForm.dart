import 'package:flutter/material.dart';

class TelefonosForm extends StatelessWidget {
  const TelefonosForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
      Text(
        "Teléfonos",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Particular',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Oficina',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Móvil',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
    ]));
  }
}
