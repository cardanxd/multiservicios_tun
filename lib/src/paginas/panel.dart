import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/paginas/Rcliente.dart';
import 'package:multiservicios_tun/src/paginas/Rvehiculo.dart';
import 'package:multiservicios_tun/src/paginas/Rorden.dart';

class Panel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  int _paginaActual = 0;
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
                      MaterialButton(
                        minWidth: 150.0,
                        height: 40.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Rcliente()),
                          );
                        },
                        color: Colors.indigo,
                        child: Text('Registrar',
                            style: TextStyle(color: Colors.white)),
                      )
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
                      MaterialButton(
                        minWidth: 150.0,
                        height: 40.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Rvehiculo()),
                          );
                        },
                        color: Colors.indigo,
                        child: Text('Registrar',
                            style: TextStyle(color: Colors.white)),
                      )
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
                      MaterialButton(
                        minWidth: 150.0,
                        height: 40.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Rorden()),
                          );
                        },
                        color: Colors.indigo,
                        child: Text('Registrar',
                            style: TextStyle(color: Colors.white)),
                      )
                    ]))
                  ])),
            ],
          ),
        ));
  }
}
