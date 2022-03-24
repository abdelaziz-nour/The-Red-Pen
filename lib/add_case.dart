import 'package:flutter/material.dart';

import 'package:training/welcom.dart';

import 'add_payment.dart';
import 'history.dart';
import 'report.dart';

class AddCase extends StatelessWidget {
  const AddCase({ Key? key }) : super(key: key);

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
                                       Text('A',style: TextStyle(color: Colors.pink,fontSize: 50),),
                                       Text('dd Case',style: TextStyle(color: Colors.black,fontSize: 50),),
                                     ],
                                   ),
                                   Container(width: 300,height: 70,
                                     child:TextField(decoration:InputDecoration(hintText: "ID"),),
                                   ),
                                   Container(width: 300,height: 70,
                                     child:TextField(decoration:InputDecoration(hintText: "Semester"),),
                                   ),
                                   Container(width: 300,height: 70,
                                     child:TextField(decoration:InputDecoration(hintText: "Amount"),),
                                   ),
                                   Card(
                                     color: Colors.white,
                                     elevation: 0,
            child: TextField(
              maxLines: 8,
              decoration: InputDecoration(
              labelText: 'Enter something',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.blueAccent), ),
            ),
            )
                                   ),
                                   Container(
                                   margin: EdgeInsets.all(20),
              child: Center(child: Text("Add",style: TextStyle(fontSize: 25,color: Colors.white),)),
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
                    ),drawer :Drawer(
        
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Center(child: Text('Admin',style: TextStyle(color: Colors.white,fontSize: 25),))
            ),
            ListTile(
              title: const Text('Add Case'),
              onTap: () {
               
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  AddCase()),
  );

              },
            ),
            ListTile(
              title: const Text('Monthly Report '),
              onTap: () {
               
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Report()),
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