import 'package:flutter/material.dart';

void main() {
  runApp(const EjercicioUno());
} // fin main

class EjercicioUno extends StatelessWidget {
  const EjercicioUno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          elevation: 10,
          toolbarHeight: 50,
           backgroundColor: Color.fromARGB(50, 0, 0, 255),
          title: Text("Mi Primer APP"),
        ),
        body:Center(
          child: Container(
            color: Colors.white60,
            height: 200,
            width: 300,
            // margin: EdgeInsets.all(20),
            // padding: EdgeInsets.all(20),
            child: Center(
              child: Text("este es un widget container",
                style:TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),

          ),
        ),
      ),
    );
  }
}// fin clase

