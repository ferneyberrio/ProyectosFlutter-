import 'package:flutter/material.dart';

String titPpl = "Paseandóte";

class Titulo extends StatefulWidget {
  const Titulo({Key? key}) : super(key: key);

  @override
  State<Titulo> createState() => _TituloState();
}

class _TituloState extends State<Titulo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Text(
            titPpl,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 100,
          height: 50,
          // color: Colors.cyan,
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("imagenes/gotas.jpg"),fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
