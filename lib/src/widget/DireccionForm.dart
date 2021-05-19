import 'package:flutter/material.dart';

class DireccionForm extends StatelessWidget {
  const DireccionForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(children: <Widget>[
      Text(
        "Dirección",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Calle',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'No. Exterior',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'No. Interior',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Entre calle',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Y la calle',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Colonia',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'C. Postal',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Ciudad',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Estado',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'País',
          prefixIcon: Icon(Icons.arrow_right_outlined),
        ),
        //controller: myController,
      ),
    ]));
  }
}
