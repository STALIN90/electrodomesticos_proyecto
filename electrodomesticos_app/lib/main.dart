import 'package:electrodomesticos_app/screen/LoginScreen.dart';
import 'package:electrodomesticos_app/screen/formularioScreen.dart';
import 'package:electrodomesticos_app/screen/productoscreen.dart';
import 'package:electrodomesticos_app/screen/registroScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Welcome());
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define a custom theme for consistent styling
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Adjust colors as desired
        primaryColor: Colors.deepPurple[800],
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(150, 50), // Set minimum button size
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16.0), // Adjust text size
          ),
        ),
      ),
      home: const Home(),
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
        title: const  Text(
        "ELECTRODOMESTICOS MICHAEL",
        style: TextStyle(
          fontSize: 24.0, // Adjust font size as desired
          color: Colors.blue, // Set a vibrant blue color
          fontFamily: 'Roboto', // Use a custom font (optional)
          fontWeight: FontWeight.w800, // Make the text bold
        ),
      ), // Replace with your app name
      ),
      body: Stack( // Use Stack to position the image behind the content
        children: <Widget>[
          // Add the background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://previews.123rf.com/images/johnpaulramirez/johnpaulramirez1509/johnpaulramirez150900063/46083425-electrodom%C3%A9sticos-equipos-para-el-hogar.jpg"),
                fit: BoxFit.cover, // Adjust as needed (cover, contain, etc.)
              ),
            ),
          ),
          Cuerpo(context), // Place your existing content on top of the image
        ],
      ),
    );
  }
}


Widget Cuerpo(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
    crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
    children: <Widget>[
      Text(
        "Welcome",
        style: TextStyle(
          fontSize: 24.0, // Adjust font size as desired
          color: Colors.blue, // Set a vibrant blue color
          fontFamily: 'Roboto', // Use a custom font (optional)
          fontWeight: FontWeight.bold, // Make the text bold
        ),
      ),
      const SizedBox(height: 20.0,), // Add spacing between elements
      BotonLogin(context),
      const SizedBox(height: 10.0), // Add smaller spacing
      BotonFormulario(context),
      const SizedBox(height: 10.0), // Add smaller spacing
      BotonRegistro(context),
      const SizedBox(height: 10.0), // Add smaller spacing
      BotonProductos(context),
      const SizedBox(height: 10.0), // Add smaller spacing
    ],
  );
}


Widget BotonLogin(context){
  return(
    ElevatedButton(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 231, 177, 231))),
      onPressed: (){
        Navigator.push(context,
       MaterialPageRoute(builder: 
       (context)=> Login()));
      }, child: Text("Login"))
  );
}


Widget BotonProductos(context) {
  return ElevatedButton(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 231, 177, 231))),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Productos()),
      );
    },
    child: const Text("Ir a Productos"),
  );
}

Widget BotonRegistro(context) {
  return ElevatedButton(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 231, 177, 231))),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Registro()),
      );
    },
    child: const Text("Ir al Registro"),
  );
}

Widget BotonFormulario(context) {
  return TextButton(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 231, 177, 231))),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Formulario()),
      );
    },
    child: const Text("Ir al Formulario"),
  );
}
