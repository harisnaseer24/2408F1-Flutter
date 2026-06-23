import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final GlobalKey<FormState> _signupKey = GlobalKey<FormState>(); //
   TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

void Register(){

 if (_signupKey.currentState!.validate()) {
      print("User added succesfully");
      print("email: ${emailController.text}");
      print("username: ${userNameController.text}");
      print("pass: ${passController.text}");

      emailController.text = '';
      userNameController.text = '';
      passController.text = '';
    } else {
      print("Please insert valid details");
    }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
        padding:EdgeInsetsGeometry.symmetric(horizontal: 24),
        child: Form(
          key: _signupKey,
          child: ListView(
            children: [
              Text("Register Now..!", style: TextStyle(color: const Color.fromARGB(255, 156, 58, 243), fontSize: 35,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              TextFormField(
                controller: userNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                              return ("Username is required");
                            } cd
                            return null;
                  
                },
                decoration: InputDecoration(
                                labelText: "Username",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.person_2),
                                hintText: "enter username"),
                          
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                              return ("Email is required");
                            }

                if (!RegExp( r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                .hasMatch(value)) {
                              return ("email format is not valid");
                            }
                            return null;
                },
                decoration: InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(Icons.mail),
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.mail),
                                hintText: "enter email"),
                          
              ),
               SizedBox(height: 15,),
              TextFormField(
                controller: passController,
                validator: (value) {
                  if (value!.isEmpty) {
                              return ("Password is required");
                            }

                            return null;
                },
                decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.security),
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.lock),
                                hintText: "enter password"),
                          
              ),
                SizedBox(height: 15,),
             
                ElevatedButton(onPressed: (){
                  Register();
                }, child:
                
                Text("Register"),
                style: ButtonStyle(
          
                ),
                
                )
          
          
          
          
            ],
          ),
        ),
        
        
        ),


      ),
      
    );
  }
}