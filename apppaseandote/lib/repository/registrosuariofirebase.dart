import 'package:firebase_auth/firebase_auth.dart';

class RegistroUsuarioFireBase{
  Future<bool> registrarusuarios(String email, String password)async{
try{
  final credenciales = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, password: password);
  return true;

}// fin try
    on FirebaseAuthException catch(e){
print(e.code);
return false;
    }// fin FirebaseAuthException
  }// fin metodo future
}//Fin clase RegistroUsuarioFireBase