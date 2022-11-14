import 'package:flutter/material.dart';

class DrawableMenu extends StatelessWidget {
  const DrawableMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffffffff), Color(0xff00c2db)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(top: 50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: FadeInImage(
                placeholder: AssetImage('imagenes/logoFYBTEC.png'),
                image: AssetImage('imagenes/logoFYBTEC.png'),
              ),
            ),
          ),
          Text('Paseandote',
          style: TextStyle(
            shadows: [
              Shadow(
                offset: Offset(3,3)
              )
            ],
            fontSize: 30,

          ),)
        ],
      ),
      ),
    );
  }
}
