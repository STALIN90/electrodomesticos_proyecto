

import 'package:electrodomesticos_app/screen/productoscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
void main (){ 
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Cuerpo(context),
    );
  }
}
Widget Cuerpo(context){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      Column(
        children: <Widget>[
         const Text("LOGIN"),
          CampoCorreo(context),
          CampoContrasenia(context),
          BotonLogin(context)
        ],
      )
      
    ),
  );
}

final TextEditingController _correo = TextEditingController();

Widget CampoCorreo(context){
  return(
    TextField(
      controller: _correo,
    decoration: InputDecoration(
      hintText: "Ingrese Correo"),
  )

  );
}
final TextEditingController _contrasenia = TextEditingController();
Widget CampoContrasenia(context){
   return(
    TextField(
      controller: _contrasenia,
    decoration: InputDecoration(
      hintText: "Ingrese Contraseña"
      ),
  )

  );
}
Widget BotonLogin(context){
  return(
      FilledButton(onPressed: (){
        login(context);
      }, 
      child: Text("Login"))
  );

}

Future<void> login(context) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _correo.text,password: _contrasenia.text);
//////////////////////////////////////////////////
Navigator.push(
          context,MaterialPageRoute(builder: (context) => Productos()));

////////////////////////////////////////////////


} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}

