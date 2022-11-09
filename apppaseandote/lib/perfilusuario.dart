import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PerfiUsuario extends StatefulWidget {
  final dk;
  const PerfiUsuario(this.dk,{Key? key}) : super(key: key);

  @override
  State<PerfiUsuario> createState() => _PerfiUsuarioState();
}

class _PerfiUsuarioState extends State<PerfiUsuario> {
  @override
  Widget build(BuildContext context) {
    var k = widget.dk;  // leo variable de otro widget
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(5),
          child: StreamBuilder<QuerySnapshot>(
            // consultar en base de datos usuarios
            stream: FirebaseFirestore.instance.collection('usuario').snapshots(),
            // stream: FirebaseFirestore.instance.collection('usuario').where('id',isEqualTo:k).snapshots(),
            builder: (context, snapshot){
              print('******kkkkk**** ${k} ******kkkkk****');
        if(snapshot.hasError){
          return Text('Existe un error en la consulta');
        }// fin if
        if(!snapshot.hasData) {
         return Text('No tiene datos en la consulta');
        }// fin if
        else{
         return ListView.builder(
             itemCount: snapshot.data?.docs.length,
                 itemBuilder: (context,index){
               QueryDocumentSnapshot usuarioFB = snapshot.data!.docs[index];
               return Card(
                 elevation: 5,
                 color: Color.fromARGB(200, index*10, index*100, index*200,),
                 child: ListTile(
                   title: Text( 'Bienvenido  ${usuarioFB['nombre']}  ${usuarioFB['apellido']} ',
                   style: const TextStyle(
                     fontSize: 24,
                     fontFamily: 'titulo',
                     fontWeight: FontWeight.bold,
                   ),
                   ),
                   subtitle: Text(' ${usuarioFB['correo']} \n ${usuarioFB['celular']} ',
                     style:  const TextStyle(
                     fontSize: 16,
                   ),
                   ),

                 ),
               );
         }
         );
        }// fin else
        },
          ),
        ),
      ),
    );
  }
}// fin clase
