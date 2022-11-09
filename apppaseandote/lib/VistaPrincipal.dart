import 'package:apppaseandote/registrousuario.dart';
import 'package:apppaseandote/tituloprincipal.dart';
import 'package:apppaseandote/vistalogin.dart';
import 'package:apppaseandote/vistasomos.dart';
import 'package:flutter/material.dart';

String txtB1 = "Somos";
String txtB2 = "Ingresar";
String txtB3 = "Registrarse";
String txtB4 = "Crear cuenta";

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
          child: const Titulo(),
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
        style: const TextStyle(
          fontSize: 40,
          fontFamily: "titulo",
          color: Colors.white,
        ),
      ),

      onPressed: () {
        // para redirigir
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Somos()));
        print("Botón Somos Presionado ");
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
        style: const TextStyle(
          fontSize: 40,
          fontFamily: "titulo",
          color: Colors.white,
        ),
      ),

      onPressed: () {
        // para redirigir
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
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
        style: const TextStyle(
          fontSize: 40,
          fontFamily: "titulo",
          color: Colors.white,
        ),
      ),

      onPressed: () {
        print("Boton registrarse Presionado ");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrarUsuario()));
      },
    );
  } // fin boton3

}
