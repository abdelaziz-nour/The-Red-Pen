import 'package:flutter/material.dart';
import 'package:training/history.dart';
import 'package:training/welcom.dart';

import 'add_payment.dart';
import 'cases.dart';

class Payment extends StatefulWidget {
  const Payment({ Key? key }) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
 Widget build(BuildContext context) {
      String dropdownValue = 'one';
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Row(
           mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The",style: TextStyle(fontSize: 35),),
                Text("Red" ,style: TextStyle(fontSize: 35,color: Colors.pink),),
                Text("Pen",style: TextStyle(fontSize: 35)),
                            ], 
                      ),
                    ),
                    body:ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text('D',style: TextStyle(color: Colors.pink,fontSize: 50),),
                                Text('onate',style: TextStyle(color: Colors.black,fontSize: 50),),
                              ],
                            ),
                               Card(
                               child: Container(
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(Icons.person,color: Colors.pink,size: 300,),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ID :',style: TextStyle(color: Colors.pink,fontSize: 25),),
                                Text('1234',style: TextStyle(color: Colors.black,fontSize: 25),),
                              ],
                            ),
                              Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Semester :',style: TextStyle(color: Colors.pink,fontSize: 25),),
                                Text('1',style: TextStyle(color: Colors.black,fontSize: 25),),
                              ],
                            ),
                            Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Amount :',style: TextStyle(color: Colors.pink,fontSize: 25),),
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Center(child: TextField())),
                                Text('SDG',style: TextStyle(color: Colors.black,fontSize: 25),),
                              ],
                            ),
                            DropdownButton<String>(
                              dropdownColor: Colors.pink,
                              hint: Text("Payment Method",style: TextStyle(fontSize: 25),),
      //value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.pink,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
                            
                            GestureDetector(
                              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Cases()),
  );
},
                              child: Container(
                                margin: EdgeInsets.all(20),
                                          child: Center(child: Text("Pay",style: TextStyle(fontSize: 25,color: Colors.white),)),
                                          height: MediaQuery.of(context).size.height/12,
                                          width: MediaQuery.of(context).size.height/4,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(100)),
                                            color: Colors.pink
                                          ),
                                        ),
                            ),
                               ],
                                 ),
                               ), 
                            )
                          ],
                        ),
                      ],
                    ),
                   drawer :Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Center(child: Text('UserName',style: TextStyle(color: Colors.white,fontSize: 25),))
            ),
            ListTile(
              title: const Text('History'),
              onTap: () {
               
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  History()),
  );

              },
            ),
            ListTile(
              title: const Text('Add Payment Method '),
              onTap: () {
               
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  AddPayment()),
  );

              
            
              }),
              ListTile(
              title: const Text('Logout '),
              onTap: () {
               
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Welcome()),
  );

              
            
              })],
        ),
      ),
                  );
}}