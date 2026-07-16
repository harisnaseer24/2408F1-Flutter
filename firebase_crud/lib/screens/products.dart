import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Products extends StatefulWidget {
  const Products({ Key? key }) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
 final CollectionReference products =
      FirebaseFirestore.instance.collection('products');


 void editProduct(productDetails){

showDialog(context: context, builder: (context){
 TextEditingController titleController=TextEditingController(text: productDetails['title']);
  TextEditingController desController=TextEditingController(text: productDetails['description']);
  TextEditingController priceController=TextEditingController(text: productDetails['price'].toString());
  TextEditingController stockController=TextEditingController(text: productDetails['stock'].toString());

  String imgUrl=productDetails['image'];

   final ImagePicker picker = ImagePicker();

getImage()async{
    // final ImagePicker picker = ImagePicker();
final XFile? image = await picker.pickImage(source: ImageSource.gallery);

final Uint8List byteImage=await image!.readAsBytes();
//image--> [12,121,25454,2187,88785,854577,4,4,878,45,4,.....]
print(byteImage);
//base 64 algorithm
final String base64img=base64Encode(byteImage);
print(base64img);
setState(() {
  imgUrl=base64img;
});
}

return AlertDialog(
  
  title: Text("Edit product : ${productDetails['title']}"),
  content: 
  // edit form
   Center(
          child: Column(
            mainAxisSize:MainAxisSize.min,
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
             Image.memory(base64Decode(imgUrl),height:100)
                       
            ],
          ),
        ),

  actions: [
    ElevatedButton(onPressed: (){
Navigator.pop(context);
    }, child: Text("Cancel")),
     ElevatedButton(onPressed:
      () {
                  // Add the product to the database
                  products.doc(productDetails['id']).update({
                    'title':titleController.text,
                    'description':desController.text,
                    'price':double.parse(priceController.text),
                    'stcok':int.parse(stockController.text),
                    'image':imgUrl,
                    
                  }).then((value) => {
                    titleController.clear(),
                    desController.clear(),
                    priceController.clear(),
                    stockController.clear(),
                   
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: 
                    Text("Product Updated successfully..✔",style: TextStyle(color: Colors.white),), backgroundColor: Colors.purple,)) ,

                    Navigator.pop(context),
                  }).catchError((error) => {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add product"),))
                  });
                }, child: Text("Update")),

  ]

);

});


 }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions:[
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, "/addproduct");
            },
             icon: Icon(Icons.add)
             )
        ]
      ),
      body: Center(
        child:  StreamBuilder<QuerySnapshot>(
                      stream: products.snapshots(),
                      builder: (context,snapshot){
                          if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
 if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(child: Text('No products available.'));
                        } 

                        var productList = snapshot.data!.docs;

               
        

                        return ListView.builder(
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            var product = productList[index];


                                      Map<String,dynamic> productDetails={
          'id':product.id,
          'title':product['title'],
          'description':product['description'],
          'stock':product['stock'],
          'price':product['price'],
          'image':product['image'],
        };
                            return ListTile(
                              title: Text(product['title']),
                              subtitle: Text('Price: \$${product['price']}'),
                              leading: CircleAvatar(
                                child: Image.memory(base64Decode(product['image']),height: 40,width: 40,fit: BoxFit.cover),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                IconButton(
                                icon: Icon(Icons.delete),
                                onPressed:  ()async {
                                await  products.doc(product.id).delete();
                                },
                              ),


IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {

                                  editProduct(productDetails);
                            
                                },
                              ),

                              ],)




                            );
                          },
                        ); 
                      }
),
      )
      
    );
  }
}