import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/paginas/Rcliente.dart';
import 'package:multiservicios_tun/src/paginas/Rvehiculo.dart';
import 'package:multiservicios_tun/src/paginas/Rorden.dart';

class Panel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text('Multiservicios Tun')),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                color: Colors.grey,
                padding: EdgeInsets.all(20.0),
                child: Row(children: <Widget>[
                  Image.asset(
                    'images/cliente.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  new Container(
                      child: new Column(children: <Widget>[
                    Text(
                      "Registrar cliente",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Rcliente()),
                          );
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.indigo),
                        child: Text("Registrar"))
                  ]))
                ])),
            SizedBox(
              height: 20,
            ),
            Container(
                color: Colors.grey[400],
                padding: EdgeInsets.all(20.0),
                child: Row(children: <Widget>[
                  Image.asset(
                    'images/vehiculo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  new Container(
                      child: new Column(children: <Widget>[
                    Text(
                      "Registrar vehiculo",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Rvehiculo()),
                          );
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.indigo),
                        child: Text("Registrar"))
                  ]))
                ])),
            SizedBox(
              height: 20,
            ),
            Container(
                color: Colors.grey,
                padding: EdgeInsets.all(20.0),
                child: Row(children: <Widget>[
                  Image.asset(
                    'images/orden.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  new Container(
                      child: new Column(children: <Widget>[
                    Text(
                      "Registrar orden",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Rorden()),
                          );
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.indigo),
                        child: Text("Registrar"))
                  ]))
                ])),
          ],
        ),
      ),
    );
  }
}
