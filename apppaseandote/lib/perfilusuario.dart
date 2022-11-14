import 'package:apppaseandote/drawablemenu.dart';
import 'package:apppaseandote/vistalistado.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class PerfiUsuario extends StatefulWidget {
  final dk;
  const PerfiUsuario(this.dk, {Key? key}) : super(key: key);

  @override
  State<PerfiUsuario> createState() => _PerfiUsuarioState();
}

class _PerfiUsuarioState extends State<PerfiUsuario> {
  @override
  Widget build(BuildContext context) {
    var k = widget.dk; // leo variable de otro widget
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Paseadores'),
        ),
        drawer: DrawableMenu(

        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: StreamBuilder<QuerySnapshot>(
            // consultar en base de datos usuarios
            stream:
                FirebaseFirestore.instance.collection('usuario').snapshots(),
            // stream: FirebaseFirestore.instance.collection('usuario').where('id',isEqualTo:k).snapshots(),

            builder: (context, snapshot) {
              print('******kkkkk**** ${k} ******kkkkk****');
              if (snapshot.hasError) {
                return Text('Existe un error en la consulta');
              } // fin if
              if (!snapshot.hasData) {
                return Text('No tiene datos en la consulta');
              } // fin if
              else {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot usuarioFB =
                          snapshot.data!.docs[index];
                      return Column(
                        children: [
                          Card(
                            elevation: 5,
                            color: Color.fromARGB(
                              100,
                              index * 10,
                              index * 100,
                              index * 200,
                            ),
                            child: ListTile(
                              title: Text(
                                'Bienvenido  ${usuarioFB['nombre']}  ${usuarioFB['apellido']} ',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'titulo',
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.black
                                ),
                              ),
                              subtitle: Text(
                                ' ${usuarioFB['correo']} \n ${usuarioFB['celular']} ',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListaPaseadores()));
                                  },

                            ),
                          ),
                          // Card(
                          //   elevation: 5,
                          //   color: Color.fromARGB(
                          //     100,
                          //     index * 10,
                          //     index * 100,
                          //     index * 200,
                          //   ),
                          //   child: ListTile(
                          //     title: Text(
                          //       'Conoce a  ${usuarioFB['nombre']}  ${usuarioFB['apellido']} ',
                          //       style: const TextStyle(
                          //         fontSize: 24,
                          //         fontFamily: 'titulo',
                          //         fontWeight: FontWeight.bold,
                          //         // color: Colors.black
                          //       ),
                          //     ),
                          //     subtitle: Text(
                          //       ' ${usuarioFB['descripcion']} \n  ',
                          //       style: const TextStyle(
                          //         fontSize: 16,
                          //       ),
                          //     ),
                          //     onTap: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) =>
                          //                   ListaPaseadores()));
                          //     },
                          //   ),
                          // ),
                        ],
                      );
                    });
              } // fin else
            },
          ),
        ),
      ),
    );
  }
} // fin clase
