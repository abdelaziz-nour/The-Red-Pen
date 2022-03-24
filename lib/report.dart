import 'package:flutter/material.dart';

import 'add_case.dart';
import 'welcom.dart';

class Report extends StatelessWidget {
  const Report({ Key? key }) : super(key: key);

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
                             Text('M',style: TextStyle(color: Colors.pink,fontSize: 30),),
                             Text('onthly Report',style: TextStyle(color: Colors.black,fontSize: 30),),
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
            'Student ID',
            style: TextStyle(fontStyle: FontStyle.italic,
            color: Colors.pink,fontSize: 22),
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
            DataCell(Text('3453',style: TextStyle(
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
            DataCell(Text('6788',style: TextStyle(
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
            DataCell(Text('1244',style: TextStyle(
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
            DataCell(Text('671',style: TextStyle(
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
            DataCell(Text('3326',style: TextStyle(
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
            DataCell(Text('2778',style: TextStyle(
            fontSize: 17))),
          ],
        ),
      ],
    ),
                      ],
                    ),
                   drawer :Drawer(
        
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