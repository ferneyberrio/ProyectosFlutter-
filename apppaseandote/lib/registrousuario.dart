import 'package:apppaseandote/mensajes.dart';
import 'package:apppaseandote/registrobdusuario.dart';
import 'package:apppaseandote/repository/registrosuariofirebase.dart';
import 'package:apppaseandote/tituloprincipal.dart';
import 'package:apppaseandote/main.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:form_validator/form_validator.dart';

import 'VistaPrincipal.dart';

class RegistrarUsuario extends StatefulWidget {
  const RegistrarUsuario({Key? key}) : super(key: key);

  @override
  State<RegistrarUsuario> createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {
  bool esHidenPassword = true; // visibilidad password
  bool visiUsu = true, visiCla = true, visiCla2 = true;
  //autenticar
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RegistroUsuarioFireBase objetorufb = RegistroUsuarioFireBase();
  final usuario = TextEditingController(); // para capturar un dato
  final clave = TextEditingController();
  final clave2 = TextEditingController();
  String usu = "", cla = "", cla2 = "", claFb = '';
  String titUsuario = "Usuario";
  String titClave = "Clave";
  String msnFbAH = "", msnUsu = '', msnCla = '', msnCla2 = '';
  final _keyform = GlobalKey<FormState>();
  // final validator1 = ValidationBuilder().email().minLength(50).build();

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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Inicio()));
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
          child: Form(
            key: _keyform,
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
      ),
    );
  }

  //usuario
  Visibility txtUsuario() {
    return Visibility(
      visible: visiUsu,
      child: Container(
        // color: Color.fromARGB(20, 0, 255, 0),
        margin: EdgeInsets.only(top: 30),
        // width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Color.fromARGB(200, 152, 157, 157),
            // border: Border.all(color: Colors.lightBlueAccent,width: 2),
            borderRadius: BorderRadius.circular(10)),

        child: TextFormField(
          validator: (valor) {
            if (validarUsu(valor.toString()).isNotEmpty) {
              return msnUsu;
            }
            return null;
          }, // fin validator
          keyboardType: TextInputType.name,
          style: (TextStyle(
              fontSize: 28, fontFamily: "titulo", fontWeight: FontWeight.bold)),
          decoration: InputDecoration(
            icon: Icon(
              Icons.email,
            ),
            border: UnderlineInputBorder(),
            hintText: "Ingrese su email de usuario",
            labelText: titUsuario,
            hintStyle: TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.normal),
            errorStyle: TextStyle(fontSize: 18),
            errorMaxLines: 2,
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
      child: Container(
        // color: Color.fromARGB(20, 0, 255, 0),
        margin: EdgeInsets.only(top: 15),
        height: 100,
        decoration: BoxDecoration(
            color: Color.fromARGB(200, 152, 157, 157),
            // border: Border.all(color: Colors.lightBlueAccent,width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          validator: (valor) {
            if (validarCla(valor.toString()).isNotEmpty) {
              return msnCla;
            }
            return null;
          }, // fin validator

          keyboardType: TextInputType.visiblePassword,
          obscureText: esHidenPassword,
          style: (TextStyle(
              fontSize: 28, fontFamily: "titulo", fontWeight: FontWeight.bold)),
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
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.normal),
            errorStyle: TextStyle(fontSize: 18),
            errorMaxLines: 2,
          ),
          controller: clave,
        ),
      ),
    );
  } // container clave

  Visibility txtClave2() {
    return Visibility(
      visible: visiCla2,
      child: Container(
        // color: Color.fromARGB(20, 0, 255, 0),
        margin: EdgeInsets.only(top: 15, bottom: 30),
        height: 100,
        decoration: BoxDecoration(
            color: Color.fromARGB(200, 152, 157, 157),
            // border: Border.all(color: Colors.lightBlueAccent,width: 2),
            borderRadius: BorderRadius.circular(10)),

        child: TextFormField(
          validator: (valor) {
            if (validarCla2(valor.toString()).isNotEmpty) {
              return msnCla2;
            }
            return null;
          }, // fin validator

          keyboardType: TextInputType.visiblePassword,
          obscureText: esHidenPassword,
          style: (TextStyle(
              fontSize: 28, fontFamily: "titulo", fontWeight: FontWeight.bold)),
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
            hintText: "Repita su contraseña",
            labelText: "Verificación $titClave",
            hintStyle: TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.normal),
            errorStyle: TextStyle(fontSize: 18),
            errorMaxLines: 2,

          ),
          controller: clave2,
        ),
      ),
    );
  } // container clave

  ElevatedButton botonRegistro() {
    return ElevatedButton(
      style: TextButton.styleFrom(backgroundColor: Colors.lightGreen),
      child: Text('Registrarse',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: "titulo",
        ),
      ),
      onPressed: () async {
        print("Boton Registrase presionado");
        // _togglePasswordView();

        usu = usuario.text.replaceAll(" ", ""); // lo que se recoje en la caja de texto
        cla = clave.text;
        cla2 = clave2.text;
        msnUsu = msnCla = msnCla2 = '';

        if (cla != cla2 || cla.contains(' ') || cla2.contains(' ')) {
          claFb = '';
          // msnCla = 'Revise la contraseña';
        } // fin if
        else {
          claFb = cla;
        }

        final datos = await objetorufb.registrarusuarios(usu, claFb);
        msnFbAH = mensajesFbase(datos); // lamar funcion mensajes

        if (_keyform.currentState!.validate()) {
          print("*************Bien");
        } // fin if
        else {
          print("*********error");
        }

        Fluttertoast.showToast(
            msg: msnFbAH,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.green,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16);
      },
    );
  } // fin botonLogin

  String mensajesFbase(String? msm) {
    switch (msm) {
      case "weak-password":
        {
          msnFbAH = ' La contraseña debe tener almenos 6 caracteres ';
          break;
        }
      case "invalid-email":
        {
          msnFbAH = msnUsu = ' el correo no es válido ';
          break;
        }
      case "email-already-in-use":
        {
          msnFbAH = msnUsu = ' El correo ya existe ';
          break;
        }
      case "network-request-failed":
        {
          msnFbAH = ' Error de Conexion A Interner ';
          break;
        }

      case "unknown":
        {
          msnFbAH = ' Error desconocido ';
          break;
        }
      default:
        {
          //capturar id generado desde FireBase
          var pk = msm.toString().split(',');
          var tam = pk.length;
          if (tam == 2) {
            msnFbAH = ' ${pk[1]}  Registrado con id : ${pk[0]} ';
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistroBDUsuario(pk[0], pk[1])));
          }
          print('Id enviado por FireBase : $msm');
        }
    }
    return msnFbAH;
  } // fin método mensajes

  _togglePasswordView() {
    setState(() {
      esHidenPassword = !esHidenPassword; // cambiar visibilidad
      // visiUsu = visiCla = visiCla2 = true;
    });
  } // fin _togglePasswordView

  String validarUsu(String _msm) {
    if (_msm.isEmpty) {
      msnUsu = 'Casilla se encuentra vacia';
    } // fin if
    return msnUsu;
  } // fin otrosMsm

  String validarCla(String _msm) {
    if (_msm.isEmpty) {
      msnCla = 'Casilla se encuentra vacia';
    } // fin if
    else if (_msm.length < 6) {
      msnCla = 'Debe tener Mínimo 6 caracteres';
    } else if (_msm.contains(' ')) {
      msnCla = 'No debe contener espacios';
    } else if (cla != cla2) {
      msnCla = 'Claves no coinciden';
    }
    return msnCla;
  } // fin otrosMsm

  String validarCla2(String _msm) {
    if (_msm.isEmpty) {
      msnCla2 = 'Casilla se encuentra vacia';
    } // fin if
    else if (_msm.length < 6) {
      msnCla2 = 'Debe tener Mínimo 6 caracteres';
    } else if (_msm.contains(' ')) {
      msnCla2 = 'No debe contener espacios';
    } else if (cla != cla2) {
      msnCla2 = 'Claves no coinciden';
    }
    return msnCla2;
  } // fin otrosMsm

} // fin clase
