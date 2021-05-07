import 'package:flutter/material.dart';
import 'package:multiservicios_tun/src/paginas/panel.dart';

class Rvehiculo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RvehiculoState();
}

class _RvehiculoState extends State<Rvehiculo>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      backgroundColor: Colors.indigo,
        title: Text('Multiservicios Tun')
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: ListView(
          children: <Widget>[
            TextField(
              enabled: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nombre del cliente',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myController, 
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Tipo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myController, 
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Modelo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Color',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Placas',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Num. Serie',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Num. Economico',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
            //Espacio entre el TextField y button
            SizedBox(height: 10,),
            //Button
            MaterialButton(
              minWidth: 200.0,
              height: 40.0,
              onPressed: (){
                //Aqui van los metodos para el registro de vehiculo
                //_mostrarAlerta(context);
                Navigator.pop(context);
              },
              color: Colors.indigo,
              child: Text('Registrar vehiculo', style: TextStyle(color: Colors.white)),
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