import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/paginas/panel.dart';

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
            //Text Field 1
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nombre completo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myController,
            ),
            //Text Field 2
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Correo electronico',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            //Espacio entre el TextField y button
            SizedBox(
              height: 10,
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

void _mostrarAlerta(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => new AlertDialog(
            title: Text("Aviso de confirmación"),
            content: Text("¡Registro exitosamente!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Panel()),
                    );
                  },
                  child: Text("Aceptar"))
            ],
          ));
}
