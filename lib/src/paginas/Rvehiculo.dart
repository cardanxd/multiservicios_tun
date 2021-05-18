import 'package:flutter/material.dart';

//marca
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
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Tipo de Equipo',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myController, 
            ),
            TextField(
              enabled: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Clientes',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myController, 
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Marca',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
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
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Placas',
                prefixIcon: Icon(Icons.arrow_right_outlined),
              ),
              //controller: myControllernum2,
            ),
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