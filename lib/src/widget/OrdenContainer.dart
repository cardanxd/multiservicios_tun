import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:multiservicios_tun/src/paginas/Rorden.dart';

class OrdenContainer extends StatelessWidget {
  const OrdenContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 175,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey),
        padding: EdgeInsets.all(20.0),
        child: Row(children: <Widget>[
          Image.asset(
            'images/orden.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            color: Colors.grey,
            colorBlendMode: BlendMode.darken,
            semanticLabel: '¿Desear realizar un nuevo registro?',
          ),
          SizedBox(
            width: 20,
          ),
          new Container(
              child: new Column(children: <Widget>[
            SizedBox(
              height: 30,
            ),
            /*SizedBox(
              height: 25,
              child: DefaultTextStyle(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  child: AnimatedTextKit(animatedTexts: [
                    TypewriterAnimatedText('¡Registrar ahora!'),
                    TypewriterAnimatedText('Registrar orden'),
                  ], isRepeatingAnimation: true, totalRepeatCount: 2)),
            ),*/
            Text(
              "Registrar orden",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: DefaultTextStyle(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  child: AnimatedTextKit(
                      animatedTexts: [TypewriterAnimatedText('Registrar')],
                      isRepeatingAnimation: true,
                      totalRepeatCount: 2)),
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
                  MaterialPageRoute(builder: (context) => Rorden()),
                );
              },
            )
          ]))
        ]));
  }
}
