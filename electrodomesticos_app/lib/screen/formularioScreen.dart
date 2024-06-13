import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Formulario());
}

class Formulario extends StatelessWidget {
  const Formulario({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Formulario",
      home: Home(),
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
        title: const Text('Formulario'),
      ),
      body: Cuerpo(context),
    );
  }
}


Widget Cuerpo(context){
  return Container(
    padding: EdgeInsets.all(20),
    child: Center(
      child: (
        Column(
          children: <Widget>[
            Text("Formulario de Productos", style: TextStyle(color: Colors.indigo)),
            CampoId(context),
            CampoProducto(context),
            CampoCtegoria(context),
            CampoPrecio(context),
            BotonGuardar(context)
    
          ],
        )
      ),
    ),
  );
}
final TextEditingController _id = TextEditingController();
Widget CampoId(context){
  return(
   
    TextField(
       controller: _id,
      decoration: InputDecoration(
        hintText: "ingresar id"
      ),
    )
  );
}
final TextEditingController _producto = TextEditingController();
Widget CampoProducto(context){
  return(
    TextField(
      controller: _producto,
      autocorrect: true,
    decoration: InputDecoration(
      hintText: "Ingresar Producto"
    ),
    )
  );
}
final TextEditingController _categoria = TextEditingController();
Widget CampoCtegoria(context){
  return(
    TextField(
      controller: _categoria ,
      decoration: InputDecoration(
        hintText: "ingresar categoria"
      ),
    )
  );
}

final TextEditingController _precio = TextEditingController();
Widget CampoPrecio(context){
  return(
    TextField(
      controller: _precio,
      decoration: InputDecoration(
        hintText: "Ingresar precio"
      ),
    )
  );
}

Widget BotonGuardar(context){

return(
  ElevatedButton(onPressed: (){
guardar();
  }, child: Text("guardar"))

);
}

Future<void> guardar() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("producto/"+_id.text);

await ref.set({
  "id": _id.text,
  "producto": _producto.text ,
  "categoria": _categoria.text,
    "precio": _precio.text
});
}

