import 'package:apppaseandote/tituloprincipal.dart';
import 'package:apppaseandote/main.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'VistaPrincipal.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //autenticar
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final usuario = TextEditingController(); // para capturar un dato
  final clave = TextEditingController();
  String usu = "", cla = "";
  String titUsuario = "Usuario";
  String titClave = "Clave";

  @override
  Widget build(BuildContext context) {
    titPpl = "Paseandote";
    return MaterialApp(
      home: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.0,1.0),
            colors: [
              Colors.white,
              Colors.blueAccent
            ]
          )
        ),
        child: Scaffold(
          // appBar: AppBar(
          //   elevation: 100,
          //   toolbarHeight: 20,
            backgroundColor: Color.fromARGB(50, 0, 0, 255),
          //   title: Text("Paseandote"),
          // ),
          appBar: AppBar(
            title: Text('AppBar Demo'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  // para redirigir
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => VistaPrincipal()));
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text('This is a snackbar')));
                },
              ),
            ],
          ),

          drawer: Drawer(
            // width: 200,
            backgroundColor: Color.fromARGB(42, 3, 60, 107),
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Menu drawer'),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(200, 79, 166, 238),
                  ),
                ),
                ListTile(
                  iconColor: Colors.white,
                  leading: Icon(
                    Icons.home,
                    size: 40,
                  ),
                  title: Text('First item'),
                  subtitle: Text("This is the 1st item"),
                  trailing: Icon(Icons.more_vert),
                  textColor: Colors.white,
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Second item'),
                  onTap: () {},
                ),
              ],
            ),
          ),

          body: Container(
            // imagen de fondo
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage("imagenes/atardecer.jpg"), fit: BoxFit.cover),
            // ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Container(
                    child: Titulo(),
                    margin: EdgeInsets.only(
                      top: 5,
                    ),
                  ),
                  //llamado funciones
                  txtUsuario(),
                  txtClave(),
                  botonLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //usuario
  Container txtUsuario() {
    return Container(
      // color: Color.fromARGB(20, 0, 255, 0),
      margin: EdgeInsets.only(top: 25),

      decoration: BoxDecoration(
          color: Color.fromARGB(200, 152, 157, 157),
          // border: Border.all(color: Colors.lightBlueAccent,width: 2),
          borderRadius: BorderRadius.circular(10)),

      child: TextFormField(
        style: (TextStyle(fontSize: 22, fontFamily: "titulo")),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Ingrese su email de usuario",
          labelText: titUsuario,
          hintStyle: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
        controller: usuario,
      ),
    );
  } // container usuario

//contraseña
  Container txtClave() {
    return Container(
      // color: Color.fromARGB(20, 0, 255, 0),
      margin: EdgeInsets.only(top: 25, bottom: 50),

      decoration: BoxDecoration(
          color: Color.fromARGB(200, 152, 157, 157),
          // border: Border.all(color: Colors.lightBlueAccent,width: 2),
          borderRadius: BorderRadius.circular(10)),

      child: TextFormField(
        style: (TextStyle(fontSize: 22, fontFamily: "titulo")),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Ingrese su contraseña",
          labelText: titClave,
          hintStyle: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
        controller: clave,
      ),
    );
  } // container clave

  ElevatedButton botonLogin() {
    return ElevatedButton(
      style: TextButton.styleFrom(backgroundColor: Colors.lightGreen),
      child: Text(
        'Ingresar',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontFamily: "titulo",
        ),
      ),
      onPressed: () async {
        usu = usuario.text; // lo que se recoje en la caja de texto
        cla = clave.text;
        try {
          final datos = await firebaseAuth.signInWithEmailAndPassword(
              email: usu, password: cla);

          if (datos != null) {
            print(datos);
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Inicio())
            );
          } // fin if
          else {
            print("Ingrese datos");
            Fluttertoast.showToast(
                msg: 'Ingrese usuario y contraseña',
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.deepPurpleAccent,
                gravity: ToastGravity.BOTTOM,
                textColor: Colors.white,
                fontSize: 16);

          }
        } // fin try
        catch (e) {
          Fluttertoast.showToast(
              msg: 'Datos no encontrados',
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.deepPurpleAccent,
              gravity: ToastGravity.BOTTOM,
              textColor: Colors.white,
              fontSize: 22);
        } // fin catch
      },
    );
  } // fin botonLogin

}
