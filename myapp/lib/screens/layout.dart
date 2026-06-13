import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({ Key? key }) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(
        title:  Text('Layout', style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body:  Center(
        child:  SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          
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
          
         
          
          ],),
        )
      ),
      
    );
  }
}