import 'package:flutter/material.dart';

class Layout2 extends StatefulWidget {
  const Layout2({ Key? key }) : super(key: key);

  @override
  _Layout2State createState() => _Layout2State();
}

class _Layout2State extends State<Layout2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(
        title:  Text('Layout2', style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body:  Center(
     
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
          
            children: [
              Container(
            height: 200,
            width: 200,
            // color: const Color.fromARGB(255, 0, 144, 248),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 144, 248),
              borderRadius: BorderRadius.circular(20)
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
               Image.network('', height: 80, width: 80,),
                Text('Flutter Layout', style: TextStyle(fontSize: 20, color: Colors.white)),
                ElevatedButton(onPressed: (){}, child: Text('Click Me') )
                ]
            )
          ),
          
      
          // 2nd
           Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 255, 0, 0),
            child:  Center(
              child: Text('Flutter Layout', style: TextStyle(fontSize: 20, color: Colors.white)),
            )
          ),
          //3rd
           Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 255, 255, 0),
            child:  Center(
              child:  Icon(Icons.menu, size: 60, color: const Color.fromARGB(255, 0, 0, 0)),
            )
          ),
          //3rd
           Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 0, 0, 0),
            child:  Center(
              child:  Icon(Icons.menu, size: 60, color: const Color.fromARGB(255, 0, 0, 0)),
            )
          ),
          //3rd
           Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 96, 0, 134),
            child:  Center(
              child:  Icon(Icons.menu, size: 60, color: const Color.fromARGB(255, 0, 0, 0)),
            )
          ),
          //3rd
           Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 0, 24, 243),
            child:  Center(
              child:  Icon(Icons.menu, size: 60, color: const Color.fromARGB(255, 0, 0, 0)),
            )
          ),
          //3rd
           Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 182, 12, 0),
            child:  Center(
              child:  Icon(Icons.menu, size: 60, color: const Color.fromARGB(255, 0, 0, 0)),
            )
          ),
          
         
          
          ],),
      
      ),
      
    );
  }
}