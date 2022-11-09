import 'package:apppaseandote/modelo/usuario.dart';
import 'package:apppaseandote/repository/registrosuariofirebase.dart';
import 'package:apppaseandote/tituloprincipal.dart';
import 'package:apppaseandote/vistalogin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistroBDUsuario extends StatefulWidget {
  final idusuario;
  final _correo;
  const RegistroBDUsuario(this.idusuario, this._correo, {Key? key})
      : super(key: key);

  @override
  State<RegistroBDUsuario> createState() => _RegistroBDUsuarioState();
}

class _RegistroBDUsuarioState extends State<RegistroBDUsuario> {
  RegistroUsuarioFireBase objufb = RegistroUsuarioFireBase(); // crear objeto
  final nombre = TextEditingController();
  final apellido = TextEditingController();
  final correo = TextEditingController();
  final celular = TextEditingController();
  final _keyform = GlobalKey<FormState>();

  String msnNom = '', msnApe = '', msnCel = '';

  void _registrarUsuario(Usuario usuario) async {
    var resultado = await objufb.crearUsuario(usuario);
    Fluttertoast.showToast(
        msg: 'Datos Guardados',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  } // fin reg usu

  @override
  Widget build(BuildContext context) {
    final idusuario = widget.idusuario;
    final _correo = widget._correo;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _keyform,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Titulo(),
                    margin: EdgeInsets.only(bottom: 50),
                  ),
                  TextFormField(
                    validator: (valor) {
                      if (validarNom(valor.toString()).isNotEmpty) {
                        return msnNom;
                      }
                      return null;
                    }, // fin validator
                    keyboardType: TextInputType.name,
                    controller: nombre,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nombre',
                      icon: Icon(
                        Icons.person,
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    validator: (valor) {
                      if (validarApe(valor.toString()).isNotEmpty) {
                        return msnApe;
                      }
                      return null;
                    }, // fin validator

                    keyboardType: TextInputType.name,
                    controller: apellido,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Apellido',
                      icon: Icon(
                      Icons.person_pin_outlined,
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Text(_correo),
                  ),
                  // TextFormField(
                  //   controller: correo,
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(), labelText: 'Correo',hintText: _correo),
                  // ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    validator: (valor) {
                      if (validarCel(valor.toString()).isNotEmpty) {
                        return msnCel;
                      }
                      return null;
                    }, // fin validator

                    keyboardType: TextInputType.phone,
                    controller: celular,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Celular',
                      icon: Icon(
                        Icons.phone_android,
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 24,
                              fontFamily: 'titulo',
                              color: Colors.white)),
                      onPressed: () {
                        print("Boton Registrase presionado");

                        msnNom = msnApe = msnCel = '';

                        if (_keyform.currentState!.validate()) {
                          print("*************Bien");
                        } // fin if
                        else {
                          print("*********error");
                        }
                        if (nombre.text.isNotEmpty &&
                            apellido.text.isNotEmpty &&
                            celular.text.isNotEmpty) {
                          var usuario = Usuario(idusuario, nombre.text,
                              apellido.text, _correo, celular.text);

                          _registrarUsuario(usuario);
                        } // fi if
                      },
                      child: Text('Registrese'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ); // fin scafold
  }

  String validarNom(String _msm) {
    if (_msm.isEmpty) {
      msnNom = 'Casilla se encuentra vacia';
    } // fin if
    return msnNom;
  } // fin otrosMsm

  String validarApe(String _msm) {
    if (_msm.isEmpty) {
      msnApe = 'Casilla se encuentra vacia';
    } // fin if
    return msnApe;
  } // fin otrosMsm

  String validarCel(String _msm) {
    if (_msm.isEmpty) {
      msnCel = 'Casilla se encuentra vacia';
    } // fin if
    if (_msm.length > 13) {
      msnCel = 'Numero debe ser inferior a 13';
    }
    return msnCel;
  } // fin otrosMsm

}
