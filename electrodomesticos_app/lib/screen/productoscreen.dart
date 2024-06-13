import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
 
void main(){
 
  runApp(Productos());
}
 
class Productos extends StatelessWidget {
  const Productos({super.key});
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Home()
    );
  }
}
//////////////////////////////////////////////////////////////////
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  List<Map<dynamic, dynamic>> productList = [];
 
  @override
  void initState() {
    super.initState();
    getData();
  }
 
  void getData() {
    /////////////////////////////////////////
    /// Función con el objetivo de traer los datos
    /////////////////////////////////////////
   
    DatabaseReference productoRef = FirebaseDatabase.instance.ref('producto');
    productoRef.onValue.listen((DatabaseEvent event) {
     
      final data = event.snapshot.value;
        print(data);
      updateProductList(data);
    });
   
  }
 
  void updateProductList(dynamic data) {
    if (data != null) {
      List<Map<dynamic, dynamic>> tempList = [];
      data.forEach((key, value) {
        //////////////////////////////////////////
        /// Se asigna la clave y valor a la lista temporal
        //////////////////////////////////////////
      if (value['producto']!=null) {
    tempList.add({"producto": value['producto'], "precio": value['precio'], "categoria":value['categoria']});
      }
        
       
      });
 
      setState(() {
        productList = tempList;
      });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase ListView'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            //////////////////////////////////////
            /// Se manda a imprimir los valores solicitados
            //////////////////////////////////////
           
            title: Text('${productList[index]["producto"]}'),
           
          );
        },
      ),
    );
  }
}


