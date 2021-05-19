import 'package:flutter/material.dart';

class VehiculoForm extends StatelessWidget {
  const VehiculoForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Tipo de Equipo',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        enabled: false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Clientes',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Marca',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Modelo',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Num. Serie',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Num. Economico',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Placas',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myControllernum2,
      ),
    ]));
  }
}
