import 'package:flutter/material.dart';

class SongApp extends StatefulWidget {
  const SongApp({ Key? key }) : super(key: key);

  @override
  _SongAppState createState() => _SongAppState();
}

class _SongAppState extends State<SongApp> {
 var singerList=[
    {"name":"Arijit Singh", "image":"arijit.jfif","songs":"200+ songs"},
    {"name":"Ali Zafar", "image":"aliZafar.jfif","songs":"100+ songs"},
    {"name":"Atif Aslam", "image":"atif.jfif","songs":"200+ songs"},
    {"name":"Shreya Goshal", "image":"shreya.jfif","songs":"250+ songs"},
  
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: Icon(Icons.sort),
        actions:[
          Icon(Icons.search),
          SizedBox(width:30)
        ]
      ),
      body: Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 20),
      child:
      Column(
        children:[
          Text("Thrilling Week", style: TextStyle(fontSize:36, fontWeight:FontWeight.bold,color:Color.fromARGB(255, 134, 48, 245)),textAlign:TextAlign.left),
  SizedBox(height:10),
       Text("2026 top songs to hang on", style: TextStyle(fontSize:24, fontWeight:FontWeight.bold,color:Color.fromARGB(255, 0, 0, 0)),textAlign:TextAlign.left),
        SizedBox(height:10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
          children: [
          Text("Explore", style: TextStyle(fontSize:29, fontWeight:FontWeight.bold,color:Color.fromARGB(255, 0, 0, 0))),

          Icon(Icons.local_fire_department, size:32,color:const Color.fromARGB(255, 129, 129, 129))
        ],),

        SizedBox(height:10),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
          children: [
          Text("Recommended", style: TextStyle(fontSize:19, color:Color.fromARGB(255, 134, 48, 245))),
          Text("2026 Songs", style: TextStyle(fontSize:19, color:Color.fromARGB(255, 138, 138, 138))),
          Text("New Songs", style: TextStyle(fontSize:19, color:Color.fromARGB(255, 138, 138, 138))),

        
        ],),

            SizedBox(height:10),


             Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height:315,
            
            child:
            ListView.builder(
              scrollDirection:Axis.horizontal,
              itemBuilder: (context,index){
                return 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage("/images/${singerList[index]["image"].toString()}"),fit: BoxFit.cover)
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(singerList[index]["name"].toString(),),
                          Text(singerList[index]["songs"].toString(),)
                        ],
                      ),
                      Icon(Icons.favorite,)
                    ],
                  ),
                              
                              
                                ],
                              ),
                );
                  
                
                
              },
              itemCount: singerList.length,
            )
            
             
            ),
          )

        ]
      )
      
      
      ),
      
    );
  }
}