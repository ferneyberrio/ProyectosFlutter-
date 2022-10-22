import 'package:flutter/material.dart';

class VistaPrincipal extends StatelessWidget {
  const VistaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Column(

    children: [
      Container(

        margin: EdgeInsets.only(top: 20),
        color: Color.fromARGB(100, 255, 255, 255),

        child: Row(
          children: [
            Container(
            //  width: 300,
             // height: 50,
              // margin: EdgeInsets.only(top: 50),
              child: Text("Paseándote",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 100,
              height: 50,
              // color: Colors.cyan,
              // margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("imagenes/atardecer.jpg"),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20),
        width: 200,
        height: 100,
        // color: Colors.cyan.withOpacity(0.05),
        child: BotonUno(),
      ),
      Container(
        margin: EdgeInsets.only(top: 20),
        width: 200,
        height: 100,
        color: Colors.lightBlueAccent.withOpacity(0.1),
      ),
      Container(
        margin: EdgeInsets.only(top: 20),
        width: 200,
        height: 100,
        color: Colors.lightGreen,
      )

      ],
  );
  }
  Widget BotonUno(){
    return ElevatedButton(//onPressed: onPressed, child: child
      style: TextButton.styleFrom(
          backgroundColor: Colors.red.withOpacity(0.1)
      ),
      child: Text('Login',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      onPressed: (){
        print("Boton Somos");
      },
    );
  }// fin widget BotonUno

}
