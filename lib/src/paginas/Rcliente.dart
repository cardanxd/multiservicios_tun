import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/widget/CreditoForm.dart';
import 'package:multiservicios_tun/src/widget/DireccionForm.dart';
import 'package:multiservicios_tun/src/widget/NombreForm.dart';
import 'package:multiservicios_tun/src/widget/SucursalForm.dart';
import 'package:multiservicios_tun/src/widget/TelefonosForm.dart';

//Razon social no es obligatorio
class Rcliente extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RclienteState();
}

class _RclienteState extends State<Rcliente> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text('Multiservicios Tun')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            NombreForm(),
            SizedBox(
              height: 16.0,
            ),
            DireccionForm(),
            SizedBox(
              height: 16.0,
            ),
            TelefonosForm(),
            SizedBox(
              height: 16.0,
            ),
            CreditoForm(),
            SizedBox(
              height: 16.0,
            ),
            SucursalForm(),
            SizedBox(
              height: 16,
            ),
            MaterialButton(
              minWidth: 200.0,
              height: 40.0,
              onPressed: () {
                //Aqui van los metodos para agregar el cliente
                //_mostrarAlerta(context);
                Navigator.pop(context);
              },
              color: Colors.indigo,
              child: Text('Registrar cliente',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}