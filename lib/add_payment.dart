import 'package:flutter/material.dart';
import 'package:training/welcom.dart';

import 'history.dart';
import 'payment.dart';

class AddPayment extends StatelessWidget {
  const AddPayment({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    body: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Row(
                                     children: [
                                       Text('A',style: TextStyle(color: Colors.pink,fontSize: 30),),
                                       Text('dd Payment Method',style: TextStyle(color: Colors.black,fontSize: 30),),
                                     ],
                                   ),
                                   Container(width: 300,height: 70,
                                     child:TextField(decoration:InputDecoration(hintText: "Name"),),
                                   ),
                                   Container(width: 300,height: 70,
                                     child:TextField(decoration:InputDecoration(hintText: "Card number"),),
                                   ),
                                   Container(width: 300,height: 70,
                                     child:TextField(decoration:InputDecoration(hintText: "Expire Date"),),
                                   ),
                                   Card(
                                     color: Colors.white,
                                     elevation: 0,
            
                                   ),
                                   Container(
                                   margin: EdgeInsets.all(20),
              child: Center(child: Text("Save",style: TextStyle(fontSize: 25,color: Colors.white),)),
              height: MediaQuery.of(context).size.height/12,
              width: MediaQuery.of(context).size.height/4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Colors.pink
              ),
            ),
                                   ]
                                   )
                                   ),
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
  }
}