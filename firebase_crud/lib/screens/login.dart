import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:introduction/components/myDrawer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>(); // unique key

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();




  var users = FirebaseFirestore.instance.collection("users");

  void LoginUser() async {
    if (_loginKey.currentState!.validate()) {

try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
    password: passController.text,

    
  );
  print("sign up success");
  print(credential.user!.uid);

// adding user details in user collection too
   // Add the product to the database
                
                    emailController.clear();
                    passController.clear();
                
                   
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: 
                    Text("Login Successfull..✔ ",style: TextStyle(color: Colors.white),), backgroundColor: const Color.fromARGB(255, 43, 62, 188),)) ;

                    Navigator.pushNamed(context,"/products");
                 

} on FirebaseAuthException catch (e) {
 if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
} catch (e) {
  print(e);
}
    } else {
      print("Please insert valid details");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // drawer: MyDrawer(),
      body: Center(
          child: Container(
              height: 700,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      width: 1, color: Colors.grey, style: BorderStyle.solid)),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: _loginKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Create an account..",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                    
                        // email
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("email is required");
                            }
                            if (!RegExp(
                                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                .hasMatch(value)) {
                              return ("email format is not valid");
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(),
                              hintText: "enter email"),
                        ),

                        //password
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("password is required");
                            }
                            if (!RegExp(
                                    r'^(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&]{5,}$')
                                .hasMatch(value)) {
                              return ("password must have an uppercase,lowercase,digit, special character and have at least 5 characters");
                            }
                            return null;
                          },
                          controller: passController,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.remove_red_eye),
                              hintText: "enter password"),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        // submit button
                        ElevatedButton(
                            onPressed: LoginUser, child: Text("Login in"))


                            , TextButton(onPressed: (){
                              Navigator.pushNamed(context, "/signup");
                            }, child: Text("Not a user? Register now"))
                        // TextField()
                      ],
                    ),
                  )))),
      // drawer: ,
      // bottomNavigationBar: ,
    );
  }
}
