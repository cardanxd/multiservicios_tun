import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/widget/InfoClienteOrden.dart';
import 'package:multiservicios_tun/src/widget/OrdenForm.dart';
import 'package:multiservicios_tun/src/widget/OrdenFormVehiculo.dart';

class Rorden extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RordenState();
}

class _RordenState extends State<Rorden> {
  DateTime now = new DateTime.now();

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
                labelText: 'Nombre del vendedor',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10.0,
            ),
            InfoClienteOrden(),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cilindros',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10.0,
            ),
            OrdenForm(),
            SizedBox(
              height: 16.0,
            ),
            OrdenFormVehiculo(),
            SizedBox(
              height: 20.0,
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
