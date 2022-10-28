import 'package:apppaseandote/tituloprincipal.dart';
import 'package:apppaseandote/vistalogin.dart';
import 'package:flutter/material.dart';

String txtB1 = "Login";
String txtB2 = "Ingresar";
String txtB3 = "Registrarse";

class VistaPrincipal extends StatefulWidget {
  const VistaPrincipal({Key? key}) : super(key: key);

  @override
  State<VistaPrincipal> createState() => _VistaPrincipalState();
}

class _VistaPrincipalState extends State<VistaPrincipal> {
  @override
  Widget build(BuildContext context) {
    titPpl = "paseandóte";
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          // margin: EdgeInsets.only(top: 50),
          child: Titulo(),
        ),
        Container(
          child: BotonUno(),
        ),
        Container(
          child: BotonDos(),
        ),
        Container(
          child: BotonTres(),
        )
      ],
    );
  }

  // crear un boton
  ElevatedButton BotonUno() {
    return ElevatedButton(
      //onPressed: onPressed, child: child
      style:
          TextButton.styleFrom(backgroundColor: Colors.yellow.withOpacity(0.3)),
      child: Text(
        txtB1,
        style: TextStyle(
          fontSize: 40,
          fontFamily: "titulo",
          color: Colors.white,
        ),
      ),

      onPressed: () {
        print("Botón Login Presionado ");
      },
    );
  }

  // fin widget BotonUno
  ElevatedButton BotonDos() {
    return ElevatedButton(
      //onPressed: onPressed, child: child
      style:
          TextButton.styleFrom(backgroundColor: Colors.blue.withOpacity(0.3)),
      child: Text(
        txtB2,
        style: TextStyle(
          fontSize: 40,
          fontFamily: "titulo",
          color: Colors.white,
        ),
      ),

      onPressed: () {
        // para redirigir
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
        print("Boton Ingresar Presionado ");
      },
    );
  }// fin widget BotonDos

  ElevatedButton BotonTres() {
    return ElevatedButton(
      //onPressed: onPressed, child: child
      style: TextButton.styleFrom(backgroundColor: Colors.red.withOpacity(0.3)),
      child: Text(
        txtB3,
        style: TextStyle(
          fontSize: 40,
          fontFamily: "titulo",
          color: Colors.white,
        ),
      ),

      onPressed: () {
        print("Boton registrarse Presionado ");
      },
    );
  } // fin boton3
}
