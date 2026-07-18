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

// image -> file -> bytes array -> base64 string -> database

// [345,45,345,3453,4534,345,45,5454]
final Uint8List byteImage=await image!.readAsBytes();

//image--> [12,121,25454,2187,88785,854,577,4,4,878,45,4,.....]

print(byteImage);
//base 64 algorithm
final String base64img=base64Encode(byteImage);
print(base64img);
setState(() {
  imgUrl=base64img;
});
}

addProduct()async {

var product= {
  
  "title":titleController.text,
  "description":desController.text,
  "price":priceController.text,
  "stock":stockController.text,
  "image":imgUrl
};

await products.add(product).then((value){
  print("Product added successfully");

   titleController.clear();
                    desController.clear();
                    priceController.clear();
                    stockController.clear();
                   
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: 
                    Text("Product added successfully..✔",style: TextStyle(color: Colors.white),), backgroundColor: Colors.purple,));

                    Navigator.pop(context);
                    
                  }).catchError((error) => {
                    print("Failed to add product: $error"),
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add product"),))
                  });

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
               addProduct();
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
