import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/firebase_options.dart';
import 'package:firebase_crud/screens/addProduct.dart';
import 'package:firebase_crud/screens/login.dart';
import 'package:firebase_crud/screens/products.dart';
import 'package:firebase_crud/screens/signup.dart';
import 'package:flutter/material.dart';



void main() async {

await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Signup() ,
      routes:{
      
        "/products":(context)=>Products(),
        "/addproduct":(context)=>Addproduct(),
        "/login":(context)=>Login(),
      }
    );
  }
}
