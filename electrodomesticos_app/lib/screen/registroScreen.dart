import 'package:flutter/material.dart';



void main(){
  runApp(Registro());
}
class Registro extends StatelessWidget {
  const Registro({super.key});

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
          Text("REGISTRO"),
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
    decoration: InputDecoration(hintText: "Ingrese Correo"),
  )

  );
}


final TextEditingController _contrasenia = TextEditingController();
Widget CampoContrasenia(context){
   return(
    TextField(
      controller: _contrasenia,
    decoration: InputDecoration(hintText: "Ingrese Contraseña"),
  )

  );
}
Widget BotonLogin(context){
  return(
    FilledButton(onPressed: (){
      
    }, child: Text("Login"))
  );

}