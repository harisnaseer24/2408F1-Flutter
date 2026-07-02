import 'package:electric_bill_calculator/screens/result.dart';
import 'package:flutter/material.dart';

class Billform extends StatefulWidget {
  const Billform({ Key? key }) : super(key: key);

  @override
  _BillformState createState() => _BillformState();
}

class _BillformState extends State<Billform> {

 
final GlobalKey<FormState> myformkey = GlobalKey<FormState>();
TextEditingController unitsController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController taxPercentController = TextEditingController();

double finalBillAmount = 0;

void calculateBill(){
if(myformkey.currentState!.validate()){

int unit =  int.parse( unitsController.text);
double price =  double.parse( priceController.text);
double taxPercent =  double.parse( taxPercentController.text);//10

double total = unit * price  ;// 50

double taxAmount = (total * taxPercent /100); //5
print(taxAmount);
print(total);
setState(() {
  finalBillAmount = total + taxAmount;
});
print(finalBillAmount);

 var billDetails = {
        'units': unit,
        'pricePerUnit': price,
        'taxPercent': taxPercent,
        'billAmount': total,
        'taxAmount': taxAmount,
        'finalBillAmount': finalBillAmount
      };
    Navigator.push(context,MaterialPageRoute(builder: (context)=>Result(billDetails)));
}
else{
  print("Fields are empty");
}


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "HN Energy Association",
            style: TextStyle(color: Colors.indigoAccent, fontSize: 25),
          ),
          centerTitle: true,
          actions: [],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Form(
              key: myformkey,
              child: ListView(
                children: [
                  Text(
                    "Enter the details",
                    style: TextStyle(fontSize: 22, color: Colors.indigoAccent),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter the number of units consumed",
                      prefixIcon: Icon(Icons.electric_bolt_outlined),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field cannot be empty";
                      }
                    },
                    controller: unitsController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter the price per unit",
                      prefixIcon: Icon(Icons.monetization_on),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field cannot be empty";
                      }
                    },
                    controller: priceController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter the tax percentage",
                      prefixIcon: Icon(Icons.percent),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field cannot be empty";
                      }
                    },
                    controller: taxPercentController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ElevatedButton(onPressed: calculateBill, child:
                  // Text("Calculate"))

                  GestureDetector(
                    onTap: calculateBill,
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.indigoAccent),
                      child: Center(
                          child: Text(
                        "Calculate Bill",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),

                  SizedBox(
                    height: 60,
                  ),
                  Text(finalBillAmount != 0
                      ? "Final Bill Amount:$finalBillAmount"
                      : "Enter values to get your bill")
                ],
              )),
        ));
  }
}