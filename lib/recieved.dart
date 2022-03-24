import 'package:flutter/material.dart';

import 'add_payment.dart';
import 'history.dart';
import 'welcom.dart';

class Recieved extends StatelessWidget {
  const Recieved({ Key? key }) : super(key: key);

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
                         child: Row(
                           children: [
                             Text('R',style: TextStyle(color: Colors.pink,fontSize: 30),),
                             Text('eceived Donations',style: TextStyle(color: Colors.black,fontSize: 30),),
                           ],
                         ),
                       ),
                       DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Date',
            style: TextStyle(fontStyle: FontStyle.italic,
            color: Colors.pink,fontSize: 25),
          ),
        ),
        DataColumn(
          label: Text(
            'Time',
            style: TextStyle(fontStyle: FontStyle.italic,
            color: Colors.pink,fontSize: 25),
          ),
        ),
        DataColumn(
          label: Text(
            'Amount',
            style: TextStyle(fontStyle: FontStyle.italic,
            color: Colors.pink,fontSize: 25),
          ),
        ),
        DataColumn(
          label: Text(
            'Change',
            style: TextStyle(fontStyle: FontStyle.italic,
            color: Colors.pink,fontSize: 25),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12-Jan',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('12:35pm',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('1000',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('8000',style: TextStyle(
            fontSize: 17))),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15-Jan',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('1:12am',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('250',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('7750',style: TextStyle(
            fontSize: 17))),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16-Jan',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('7:55am',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('500',style: TextStyle(
            fontSize: 17)),),
            DataCell(Text('7250',style: TextStyle(
            fontSize: 17))),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16-Jan',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('10:02pm',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('50',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('7200',style: TextStyle(
            fontSize: 17))),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('17-Jan',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('7:55am',style: TextStyle(
            fontSize: 17)),),
            DataCell(Text('300',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('6900',style: TextStyle(
            fontSize: 17))),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18-Jan',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('2:08pm',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('500',style: TextStyle(
            fontSize: 17))),
            DataCell(Text('6400',style: TextStyle(
            fontSize: 17))),
          ],
        ),
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
  }
}