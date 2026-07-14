import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({ Key? key }) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
 final CollectionReference products =
      FirebaseFirestore.instance.collection('products');


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