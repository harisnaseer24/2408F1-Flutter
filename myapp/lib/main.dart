import 'package:flutter/material.dart';
import 'package:myapp/screens/layout.dart';
import 'package:myapp/screens/productDetails.dart';

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
      home: ProductDetails(),
      // routes:{
      //   '/productDetails':(context)=>ProductDetails()
      // }
    );
  }
}
