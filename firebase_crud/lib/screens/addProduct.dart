import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({ super.key });

  @override
  _AddproductState createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
 final CollectionReference products =
      FirebaseFirestore.instance.collection('products');


  TextEditingController titleController=TextEditingController();
  TextEditingController desController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController stockController=TextEditingController();

String imgUrl="";
final picker = ImagePicker();

getImage()async{
// Pick an image.
final XFile? image = await picker.pickImage(source: ImageSource.gallery);

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Add new product as "),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context,"/add");
            }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: ListView(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Enter the title of the product",
                ),
              ),
              TextField(
                controller: desController,
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "Enter the description of the product",
                ),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: "Price",
                  hintText: "Enter the price of the product",
                ),
              ),

               TextField(
                controller: stockController,
                decoration: InputDecoration(
                  labelText: "Stock",
                  hintText: "Enter the stock of the product",
                ),
              ),
             ElevatedButton(onPressed:
             (){
              getImage();
             }
             , child: Text("Choose File")),

                        ElevatedButton(
                onPressed: () {
               
                },
                child: Text("Add product"),
              ),
            ],
          ),
        ),
      )
      ,
    );
  }
}
