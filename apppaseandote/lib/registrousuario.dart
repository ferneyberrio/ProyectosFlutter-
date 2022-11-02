import 'package:apppaseandote/repository/registrosuariofirebase.dart';
import 'package:apppaseandote/tituloprincipal.dart';
import 'package:apppaseandote/main.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'VistaPrincipal.dart';

class RegistrarUsuario extends StatefulWidget {
  const RegistrarUsuario({Key? key}) : super(key: key);

  @override
  State<RegistrarUsuario> createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {
  //autenticar
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RegistroUsuarioFireBase objetorufb = RegistroUsuarioFireBase();
  final usuario = TextEditingController(); // para capturar un dato
  final clave = TextEditingController();
  final clave2 = TextEditingController();
  String usu = "", cla = "", cla2 = "";
  String titUsuario = "Usuario";
  String titClave = "Clave";

  @override
  Widget build(BuildContext context) {
    titPpl = "Paseandote";
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   elevation: 100,
        //   toolbarHeight: 20,
        //   backgroundColor: Color.fromARGB(50, 0, 0, 255),
        //   title: Text("Paseandote"),
        // ),
        appBar: AppBar(
          title: Text(' Paseandote '),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              tooltip: 'Show Snackbar',
              onPressed: () {
                // para redirigir
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Inicio()));
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
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("imagenes/atardecer.jpg"), fit: BoxFit.cover),
          ),
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
                txtClave2(),
                botonRegistro(),
              ],
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
      margin: EdgeInsets.only(top: 30),
      // width: 100,
      height: 60,
      decoration: BoxDecoration(
          color: Color.fromARGB(200, 152, 157, 157),
          // border: Border.all(color: Colors.lightBlueAccent,width: 2),
          borderRadius: BorderRadius.circular(10)),

      child: TextFormField(
        style: (TextStyle(fontSize: 28, fontFamily: "titulo",fontWeight: FontWeight.bold) ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Ingrese su email de usuario",
          labelText: titUsuario,
          hintStyle: TextStyle(
            color: Colors.black54,fontSize: 22,fontWeight: FontWeight.normal
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
      margin: EdgeInsets.only(top: 15),
      height: 60,
      decoration: BoxDecoration(
          color: Color.fromARGB(200, 152, 157, 157),
          // border: Border.all(color: Colors.lightBlueAccent,width: 2),
          borderRadius: BorderRadius.circular(10)),

      child: TextFormField(
        style: (TextStyle(fontSize: 28, fontFamily: "titulo",fontWeight: FontWeight.bold)),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Ingrese su contraseña",
          labelText: titClave,
          hintStyle: TextStyle(
            color: Colors.black54,fontSize: 22,fontWeight: FontWeight.normal
          ),
        ),
        controller: clave,
      ),
    );
  } // container clave

  Container txtClave2() {
    return Container(
      // color: Color.fromARGB(20, 0, 255, 0),
      margin: EdgeInsets.only(top: 15, bottom: 30),
      height: 60,
      decoration: BoxDecoration(
          color: Color.fromARGB(200, 152, 157, 157),
          // border: Border.all(color: Colors.lightBlueAccent,width: 2),
          borderRadius: BorderRadius.circular(10)),

      child: TextFormField(
        style: (TextStyle(fontSize: 28, fontFamily: "titulo",fontWeight: FontWeight.bold)),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Repita su contraseña",
          labelText: titClave,
          hintStyle: TextStyle(
            color: Colors.black54,fontSize: 22,fontWeight: FontWeight.normal
          ),
        ),
        controller: clave2,
      ),
    );
  } // container clave

  ElevatedButton botonRegistro() {
    return ElevatedButton(
      style: TextButton.styleFrom(backgroundColor: Colors.lightGreen),
      child: Text(
        'Registrarse',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,fontWeight: FontWeight.bold,
          fontFamily: "titulo",
        ),
      ),
      onPressed: () async {
        usu = usuario.text; // lo que se recoje en la caja de texto
        cla = clave.text;
        cla2 = clave2.text;
        if (cla != cla2) {
          Fluttertoast.showToast(
              msg:
                  'contraseñas no coinciden',
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.green,
              gravity: ToastGravity.BOTTOM,
              textColor: Colors.white,
              fontSize: 16);
        } // fin if
        final datos = await objetorufb.registrarusuarios(usu, cla);
        if (datos) {
          Fluttertoast.showToast(
              msg:
                  'Datos Registrados de manera correctamente  usuario : $usu  clave: $cla ',
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.green,
              gravity: ToastGravity.BOTTOM,
              textColor: Colors.white,
              fontSize: 16);
        } // fin if datos
      },
    );
  } // fin botonLogin

}
