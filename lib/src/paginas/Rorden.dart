import 'package:flutter/material.dart';

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
              height: 10,
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
                enabled: false,
                labelText: 'Nombre del vendedor',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Cliente:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Nombre del cliente',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Info. Vehiculo:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Placas',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Tipo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Modelo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Color',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Num. Serie',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Num. Economico',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Condicion Venta:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Condicion venta',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Urgencia Inicial:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Urgencia Inicial',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Atencion:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Atencion',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Comentarios:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Comentarios',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Centro Costo:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Centro costo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Cilindros:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cilindros',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            SizedBox(
              height: 10,
            ),

            

            MaterialButton(
              minWidth: 200.0,
              height: 40.0,
              onPressed: () {
                /*int suma = int.parse(myController.text) + int.parse(myControllernum2.text);
                return showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      content: Text(suma.toString()),
                    );
                  }
                );*/
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
