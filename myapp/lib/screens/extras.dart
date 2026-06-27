import 'package:flutter/material.dart';
import 'package:myapp/screens/listView.dart';
import 'package:myapp/screens/productDetails.dart';

class Extras extends StatefulWidget {
  const Extras({ Key? key }) : super(key: key);

  @override
  _ExtrasState createState() => _ExtrasState();
}

class _ExtrasState extends State<Extras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extras"),
        leading: Icon(Icons.accessibility_new_rounded),
        actions: [
          IconButton(icon:Icon(Icons.add),onPressed: (){
            Navigator.pushReplacementNamed(context, "/products");
            // Navigator.push(context, route)

          },),
           IconButton(icon:Icon(Icons.person),onPressed: (){
            Navigator.pushNamed(context, "/signup");
            // Navigator.push(context, route)

          },),
          GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
          },
          child:  Icon(Icons.login),
          )
         ,
        ],
      ),


      body: Center(
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Container(
              height: 450,
              width: 450,
              color: const Color.fromARGB(255, 0, 158, 16),
            ),
             Container(
              height: 350,
              width: 350,
              color: const Color.fromARGB(255, 158, 0, 0),
            ),
             Container(
              height: 250,
              width: 250,
              color: const Color.fromARGB(255, 254, 246, 0),
            ),
             Container(
              height: 150,
              width: 150,
              color: const Color.fromARGB(255, 0, 199, 196),
            )
          ],
        ),
      ),
      
    );
  }
}

// GridViewBuilder
//BottomNavigationBar
//Drawer