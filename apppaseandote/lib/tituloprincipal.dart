import 'package:flutter/material.dart';

String titPpl = "";

class Titulo extends StatefulWidget {
  const Titulo({Key? key}) : super(key: key);

  @override
  State<Titulo> createState() => _TituloState();
}

class _TituloState extends State<Titulo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Container(
          width: 100,
          height: 100,
          // color: Colors.cyan,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("imagenes/logoFYBTEC.png"),fit: BoxFit.cover,
            ),
          ),
        ),

        // Container(
        //   margin: EdgeInsets.only(top: 30),
        //   child: Text(
        //     titPpl,
        //     style: TextStyle(
        //       fontSize: 25,
        //       fontWeight: FontWeight.bold,
        //     ),
        //     textAlign: TextAlign.center,
        //   ),
        // ),

      ],
    );
  }
}
