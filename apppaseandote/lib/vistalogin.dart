import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuario = TextEditingController(); // para capturar un dato
  final clave = TextEditingController();
  String titulo = "Labet text";
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[
      // Container(
      //   color: Color.fromARGB(20, 0, 255, 0),
      //   margin: EdgeInsets.only(top: 5),
      //   child: ListTile(
      //     title: Text("Titulo del List"),
      //     subtitle: Text("Contenido"),
      //     leading: Icon(
      //       Icons.add_moderator_sharp,
      //       color: Colors.green,
      //     ),
      //   ),
      // ),
        Container(
          color: Color.fromARGB(20, 0, 255, 0),
          margin: EdgeInsets.only(top: 10),

          child: TextField(
            controller: usuario,  // lo capturado en el textfield lo almacene en usuario
            decoration: InputDecoration(
              hintText: "usuario",
              labelText: titulo
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(20, 0, 0, 255),
          margin: EdgeInsets.only(top: 10),

          child: TextField(
            controller: clave,  // lo capturado en el textfield lo almacene en usuario
            decoration: InputDecoration(
                hintText: "Clave ***"
            ),
          ),
        )

      ],
    );
  }
}
