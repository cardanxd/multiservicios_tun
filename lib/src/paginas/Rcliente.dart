import 'package:flutter/material.dart';

class Rcliente extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RclienteState();
}

class _RclienteState extends State<Rcliente>{
  
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
            //Text Field 1
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nomre completo',
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
            SizedBox(height: 10,),
            //Button
            MaterialButton(
              minWidth: 200.0,
              height: 40.0,
              onPressed: (){
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
              child: Text('Registrar cliente', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}