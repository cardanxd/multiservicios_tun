import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/paginas/Rcliente.dart';

class ClienteContainer extends StatelessWidget {
  const ClienteContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 200,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey),
        child: Row(children: <Widget>[
          Image.asset(
            'images/cliente.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            color: Colors.grey,
            colorBlendMode: BlendMode.darken,
            semanticLabel: '¿Desear realizar un nuevo registro?',
          ),
          Divider(endIndent: 30.0),
          new Container(
              child: new Column(children: <Widget>[
            Divider(height: 30),
            Text(
              "Clientes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            Divider(height: 20.0),
            ElevatedButton(
              child: Text('Registrar',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                onPrimary: Colors.grey[900],
                shadowColor: Colors.black,
                elevation: 10,
                minimumSize: Size(150, 40),
                alignment: Alignment.center,
                shape: StadiumBorder(),
                side: BorderSide(color: Colors.indigo[600], width: 2),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rcliente()),
                );
              },
            )
          ]))
        ]));
  }
}
