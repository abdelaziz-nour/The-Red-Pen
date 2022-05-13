import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginPage.dart';
import 'add_paymentMethodPage.dart';
import 'apiModels/my_api.dart';
import 'casesPage.dart';
import 'donationsHistoryPage.dart';

class Donate extends StatefulWidget {
  Donate(this.username, this.list, this.index);
  final String username;

  final List list;
  final int index;
  @override
  State<Donate> createState() => _DonateState(username, list, index);
}

class _DonateState extends State<Donate> {
  final String username;
  final List list;
  final int index;
  _DonateState(this.username, this.list, this.index);

  final _amountController = TextEditingController();
  DatabaseHelper _databaseHelper = DatabaseHelper();
  final _amountformKey = GlobalKey<FormState>();

  void _showDialog(context, String title, String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text(title),
              content: new Text(content),
              actions: <Widget>[
                new ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: new Text(
                      'Close',
                    ),
                    onPressed: () {
                      if (title == 'Failed') {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => Cases(username),
                          ),
                        );
                      }
                    })
              ]);
        });
  }

  _onPressed(context) async {
    await _databaseHelper.donate(
      list[index]['id'],
      int.parse(_amountController.text.trim()),
    );
    if (_databaseHelper.status) {
      _showDialog(context, 'Failed', 'Donations failed please try again');
    } else {
      _showDialog(context, 'Success', 'Donation done successfully.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "The",
              style: TextStyle(fontSize: 35),
            ),
            Text(
              "Red",
              style: TextStyle(fontSize: 35, color: Colors.pink),
            ),
            Text("Pen", style: TextStyle(fontSize: 35)),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Icon(
            Icons.person,
            color: Colors.pink,
            size: MediaQuery.of(context).size.height / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ID :',
                style: TextStyle(color: Colors.pink, fontSize: 25),
              ),
              Text(
                (list[index]['id']).toString(),
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Semester :',
                style: TextStyle(color: Colors.pink, fontSize: 25),
              ),
              Text(
                (list[index]['student_semester']).toString(),
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fees :',
                style: TextStyle(color: Colors.pink, fontSize: 25),
              ),
              Text(
                (list[index]['student_education_dues']).toString(),
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ],
          ),
          Form(
            key: _amountformKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Amount :',
                  style: TextStyle(color: Colors.pink, fontSize: 25),
                ),
                Container(
                  width: MediaQuery.of(context).size.height / 5,
                  child: TextFormField(
                    controller: _amountController,
                    maxLength: 9,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'SDG',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
            width: MediaQuery.of(context).size.height / 3,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              ),
              child: Text('Donate'),
              onPressed: () {
                if (_amountformKey.currentState!.validate()) {
                  _onPressed(context);
                  _showDialog(
                      context, 'Success', 'Donations done successfully.');
                }
              },
            ),
          ),
        ],
      )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
                child: Center(
                    child: Text(
                  username,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ))),
            ListTile(
              title: const Text('Cases'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cases(username)),
                );
              },
            ),
            ListTile(
              title: const Text('History'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => History(username)),
                );
              },
            ),
            ListTile(
                title: const Text('Add Payment Method '),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddPayment(username)),
                  );
                }),
            ListTile(
                title: const Text('Logout '),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
