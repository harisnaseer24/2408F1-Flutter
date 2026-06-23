import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  var user = {"name": "Shakoor Ahmed", "age": "18"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.accessibility),
        title: Text("User Details",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 7, 12, 114),

        actions: [
          Icon(Icons.favorite,color: const Color.fromARGB(255, 248, 248, 248),size: 18,),
          SizedBox(width: 5,),
          Icon(Icons.person,color: Colors.white,size: 18,),
          SizedBox(width: 5,),
          Icon(Icons.logout,color: Colors.white,size: 18,),




        ],

      ),
      body: Center(
        child: Column(
          children: [
            Text("User Name : ${user['name']}"),
            Text("User Age : ${user['age']}"),
            ElevatedButton(
              onPressed: () {
                print("User Name  Before: ${user['name']}");
                if (user['name'] == "Ghafoor Ahmed") {
                    setState(() {                      
                  user['name'] = "Shakoor Ahmed";
                    });
                } else if(  user['name'] == "Shakoor Ahmed") {
                  setState(() {              
                  user['name'] = "Ghafoor Ahmed";
                  });
                }
                print("User Name  After: ${user['name']}");
              },
              child: Text("Change Name"),
            ),
          ],
        ),
      ),
    );
  }
}
