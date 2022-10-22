import 'package:flutter/material.dart';

class WColumna extends StatelessWidget {
  const WColumna({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('imagenes/fondodienteleon.jpg',width: 150, ),
      Text("Diente León",
      style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.deepPurpleAccent,
      fontFamily: 'miletra'
      ),
      ),
      Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 2),
        ),
        // color: Colors.black54,
        //height:200 ,
        //width: 300,
        child: Text("Lorem ipsum es simplemente el "
            "texto de relleno"
            "Lorem ipsum es simplemente el "
            "texto de relleno",
        textAlign:  TextAlign.center,
        style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontFamily: 'miletra'
    ),

        ),
      )

      ],
    );
  }
}
