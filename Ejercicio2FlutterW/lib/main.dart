import 'package:ejercicio2flutterw/contenedor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 100,
          toolbarHeight: 20,
          backgroundColor: Color.fromARGB(50, 0, 0, 255),
          title: Text("Mi segunda APP"),
        ),

        body: Center(
          child: Container(
            // child: Image.asset("fondodienteleon.jpg", width: 100,),
            decoration: BoxDecoration(
              image: DecorationImage(
               image: AssetImage('imagenes/gotasOpacas.jpg'),
                   fit: BoxFit.cover
              ),
            ),
            padding: EdgeInsets.all(50),
            child:WColumna()
          ),
        ),
      ),

    );
  }
}

