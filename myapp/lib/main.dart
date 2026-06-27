import 'package:flutter/material.dart';
import 'package:myapp/screens/extras.dart';
import 'package:myapp/screens/layout.dart';
import 'package:myapp/screens/listView.dart';
import 'package:myapp/screens/listviewbuilder.dart';
import 'package:myapp/screens/productDetails.dart';
import 'package:myapp/screens/signup.dart';
import 'package:myapp/screens/userDetails.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
  
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Extras(),
      
      routes: {
      
        "/listview": (context) => Layout2(),
        "/signup": (context) => Signup(),
        "/products": (context) => ProductList(),
        "/productdetails": (context) => ProductDetails(),
      }
      // routes:{
      //   '/productDetails':(context)=>ProductDetails()
      // }
    );
  }
}
