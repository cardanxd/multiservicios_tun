import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/widget/VehiculoForm.dart';

//marca
class Rvehiculo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RvehiculoState();
}

class _RvehiculoState extends State<Rvehiculo> {
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
            VehiculoForm(),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              minWidth: 200.0,
              height: 40.0,
              onPressed: () {
                //Aqui van los metodos para el registro de vehiculo
                //_mostrarAlerta(context);
                Navigator.pop(context);
              },
              color: Colors.indigo,
              child: Text('Registrar vehiculo',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
