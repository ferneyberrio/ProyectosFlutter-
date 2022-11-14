import 'package:apppaseandote/perfilusuario.dart';
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
  bool esHidenPassword = true; // visibilidad password
  bool visiUsu = false, visiCla = false;
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
                end: Alignment(0.0, 5.0),
                colors: [Colors.white, Colors.blue])),
        child: Scaffold(
          backgroundColor: Color.fromARGB(50, 0, 0, 255),
          appBar: AppBar(
            title: Text('Login'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                tooltip: 'Ir al Home',
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
            // width: 300,
            elevation: 20,
            backgroundColor: Color.fromARGB(200, 255, 255, 255),
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('PASEANDOTE'),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(200, 79, 166, 238),
                  ),
                ),
                ListTile(
                  iconColor: Colors.blue,
                  leading: Icon(
                    Icons.home,
                    size: 40,
                  ),
                  title: Text('First item'),
                  subtitle: Text("This is the 1st item"),
                  trailing: Icon(Icons.more_vert),
                  textColor: Colors.black,
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Second item'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          body: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                  Container(
                    child: const Titulo(),
                    ),
              Container(child: txtUsuario()),
              Container(child: txtClave()),
              Container(margin: EdgeInsets.all(20),child: botonLogin()),

            ],
          ),
        ),
      ),
    );
  }

  //usuario
  Visibility txtUsuario() {
    return Visibility(
      visible: visiUsu,
      child: Container(
        // color: Color.fromARGB(20, 0, 255, 0),
        margin: EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),

        decoration: BoxDecoration(
            color: Color.fromARGB(200, 152, 157, 157),
            // border: Border.all(color: Colors.lightBlueAccent,width: 2),
            borderRadius: BorderRadius.circular(10)),

        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: (TextStyle(fontSize: 26, fontFamily: "titulo")),
          decoration: InputDecoration(
            icon: Icon(Icons.account_circle_outlined),
            border: InputBorder.none,
            hintText: "Ingrese su email de usuario",
            labelText: titUsuario,
            hintStyle: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
          controller: usuario,
        ),
      ),
    );
  } // container usuario

//contraseña
  Visibility txtClave() {
    return Visibility(
      visible: visiCla,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            // color: Color.fromARGB(20, 0, 255, 0),
            margin: EdgeInsets.only(top: 10, bottom: 10,left: 5,right: 5),

            decoration: BoxDecoration(
                color: Color.fromARGB(200, 152, 157, 157),
                // border: Border.all(color: Colors.lightBlueAccent,width: 2),
                borderRadius: BorderRadius.circular(10)),

            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: esHidenPassword,
              style: (TextStyle(fontSize: 26, fontFamily: "titulo")),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.password,
                ),
                suffixIcon: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      Icons.visibility,
                      size: 30,
                    )),
                border: InputBorder.none,
                hintText: "Ingrese su contraseña",
                labelText: titClave,
                hintStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              controller: clave,
            ),
          ),
        ],
      ),
    );
  } // container clave

  ElevatedButton botonLogin() {
    return ElevatedButton(
      style: TextButton.styleFrom(backgroundColor: Colors.lightGreen),
      child: Text(
        'Ingresar',
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontFamily: "titulo",
        ),
      ),
      onPressed: () async {
        if (visiCla) {
          usu = usuario.text; // lo que se recoje en la caja de texto
          usu = usu.replaceAll(" ", "");
          cla = clave.text;
          try {
            final datos = await firebaseAuth.signInWithEmailAndPassword(
                email: usu, password: cla);

            if (datos != null) {
              print(datos);
              var k = (FirebaseAuth.instance.currentUser?.uid); // consultar id usuario
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>  PerfiUsuario(k)));
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
                msg: e.toString(),
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.deepPurpleAccent,
                gravity: ToastGravity.BOTTOM,
                textColor: Colors.white,
                fontSize: 22);
          } // fin catch
        } // fin if
        _toggleFieldView();
      },
    );
  } // fin botonLogin

  _togglePasswordView() {
    setState(() {
      esHidenPassword = !esHidenPassword; // cambiar visibilidad
    });
  } // fin _togglePasswordView
  _toggleFieldView() {
    setState(() {
      visiUsu = visiCla = true;
    });
  } // fin _togglePasswordView


}
