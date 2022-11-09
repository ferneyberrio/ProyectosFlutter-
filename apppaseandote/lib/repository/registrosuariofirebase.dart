import 'package:apppaseandote/modelo/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistroUsuarioFireBase {
  Future<String?> registrarusuarios(String email, String password) async {
    try {
      final credenciales = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print('FIREBASEAUTHEX******* ${credenciales.user?.email}'); // imprimir mensaje deseado
      return (credenciales.user?.uid).toString() + "," + (credenciales.user?.email).toString() ;
    } // fin try
    on FirebaseAuthException catch (e) {
      print('FIREBASEAUTHEX******* ${e.code}'); // imprimir mensaje deseado
      return e.code;
    } // fin FirebaseAuthException
    on FirebaseException catch (e) {
      print('FIREBASEAUTHEX****** ${e.code}'); // imprimir mensaje deseado
      return e.code;
    }
  }

  Future <String> crearUsuario(Usuario usuario) async{
    try{
      final documento = await FirebaseFirestore.instance.collection('usuario').doc(usuario.id).set(usuario.convertir());
    return usuario.id;
    }// fin try
    on FirebaseException catch(e){
      return e.code;
    }//fin on
  } // fin metodo future

} //Fin clase RegistroUsuarioFireBase
