import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class ListaPaseadores extends StatefulWidget {
  const ListaPaseadores({Key? key}) : super(key: key);

  @override
  State<ListaPaseadores> createState() => _ListaPaseadoresState();
}

class _ListaPaseadoresState extends State<ListaPaseadores> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nuestros Paseadores'),
          elevation: 10,
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
          // backgroundColor: Color.fromARGB(200, 255, 255, 255),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
               DrawerHeader(
                child: Text('PASEANDOTE'),
                decoration: BoxDecoration(
                  color: Color.fromARGB(200, 79, 166, 238),
                  image: DecorationImage(image: AssetImage('imagenes/plantingLogo.png'))
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
        body: Padding(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          padding:  EdgeInsets.all(5),
           child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('paseadores')
                  .snapshots(), // llerr datos FB
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error enla consulta');
                } // fin if
                else if (!snapshot.hasData) {
                  return Text('No existen datos');
                } // fin if
                else {
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot paseadoresFB =
                          snapshot.data!.docs[index];
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 5,
                            color: Colors.green,
                            child: ListTile(
                              title: Text(
                                  '${paseadoresFB['nombre']}   ${paseadoresFB['apellido']}',
                                style: const TextStyle(
                                fontSize: 24,
                                fontFamily: 'titulo',
                                fontWeight: FontWeight.bold,
                                // color: Colors.black
                              ),
                              ),
                              subtitle:
                                  Text('${paseadoresFB['descripcion']}  '),
                              leading: Image.network(paseadoresFB['logo']),
                            ),
                          ),
                        ],
                      );
                    }, // fin item builder
                  );
                } // fin else
              }, // fin Stream
            ),
          // ],
        ),
      ),
    );
  }
}
