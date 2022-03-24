import 'package:flutter/material.dart';

import 'add_payment.dart';
import 'welcom.dart';

class History extends StatelessWidget {
  const History({ Key? key }) : super(key: key);

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
                    body:ListView(
                      padding: EdgeInsets.all(15),
                     children:  <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Row(
                           children: [
                             Text('H',style: TextStyle(color: Colors.pink,fontSize: 50),),
                             Text('istory',style: TextStyle(color: Colors.black,fontSize: 50),),
                           ],
                         ),
                       ),
                       cases(9857, 6, 9000),
                       cases(3759, 2, 9000),
                       cases(3519, 6, 2250),
                       cases(1588, 4,8000),
                       cases(3555, 5, 1245),
                       cases(8885, 2, 550),
                       cases(9587, 1, 13200),
                       cases(6248, 7, 500),
                       cases(352, 8, 250),
                       cases(4442, 3, 7200),
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
Widget cases(int first,int second,int third){
  return Card(
    shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.pink, width: 1),
    borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(Icons.person,size: 50,color: Colors.pink,),
        title: Text('ID: $first'),
        subtitle: Text('Semester : $second\nAmount: $third'),
        trailing: Text('DD/MM/YY',style: TextStyle(color: Colors.pink,fontSize: 15),),
        isThreeLine: true,
      ),
    );
}