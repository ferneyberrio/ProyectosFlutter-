import 'package:flutter/material.dart';

class Somos extends StatelessWidget {
  const Somos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0.0, 5.0),
                colors: [Colors.white, Colors.blue])),
        child: Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    _cardUno(),
                    _cardDos(),
                    _cardTres(),
                  ],
                ),
              ),
            )),
      ),
    ); //fin return
  }

  Widget _cardUno() {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'paseandote',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'titulo',
                  color: Colors.blue),
            ),
            SizedBox(
              height: 10,
            ),
            Text('PASEANDOTE'),
          ],
        ),
      ),
    );
  } // fin Widget_cardUno

  Widget _cardDos() {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ClipRRect(
            borderRadius:BorderRadius.circular(150),

              child: FadeInImage(
                  placeholder: AssetImage('imagenes/gotas.jpg'),
                  image: AssetImage('imagenes/logoFYBTEC.png')),
    ),
            Text(' Paseando a Tu mascota el será feliz')
          ],
        ),
      ),
    );
  } // fin Widget_cardDos

  Widget _cardTres() {
    return Card(
      elevation: 10,
      color: Colors.purple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                ,style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
      ),
    );
  } // fin Widget_cardTres

} // fin clase somos
