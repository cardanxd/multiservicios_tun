import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/paginas/Rcliente.dart';

class ClienteContainer extends StatelessWidget {
  const ClienteContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        height: 180,
        padding: EdgeInsets.all(20.0),
        child: Row(children: <Widget>[
          Image.asset(
            'images/cliente.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
              width: 20,
            ),
          new Container(
              child: new Column(children: <Widget>[
               SizedBox(
              height: 40.0,
            ), 
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
        ]));
  }
}
