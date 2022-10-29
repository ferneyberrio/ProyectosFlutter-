import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'VistaPrincipal.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const Inicio());
}
// String imagenFondo = "imagenes/atardecer.jpg";

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        // imagen de fondo
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("imagenes/atardecer.jpg"), fit: BoxFit.cover),
        ),

        child: Scaffold(
          backgroundColor: Colors.transparent,
          // barra superior
            appBar: AppBar(
              elevation: 100,
              toolbarHeight: 20,
              backgroundColor: Color.fromARGB(50, 0, 0, 255),
              title: Text("Paseandote"),
            ),


            body: VistaPrincipal(),
          // body: Login(),
        ),
      ),
    );
  }

}
