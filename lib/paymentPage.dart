import 'package:flutter/material.dart';
import 'package:training/apiModels/my_api.dart';
import 'package:training/donationsHistoryPage.dart';
import 'package:training/loginPage.dart';

import 'add_paymentMethodPage.dart';
import 'casesPage.dart';

class Payment extends StatefulWidget {
  final String username;

  final List list;
  final int index;
  Payment(this.list, this.index, this.username);
  @override
  _PaymentState createState() => _PaymentState(list, index, username);
}

class _PaymentState extends State<Payment> {
  List list;
  int index;
  String username;
  _PaymentState(this.list, this.index, this.username);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final amountController = TextEditingController();
    DatabaseHelper _databaseHelper = DatabaseHelper();

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
                              builder: (BuildContext context) =>
                                  Cases(username),
                            ),
                          );
                        }
                      })
                ]);
          });
    } /*

    */

    _onPressed(context) async {
      await _databaseHelper.donate(
        list[index]['id'],
        int.parse(amountController.text.trim()),
      );
      if (_databaseHelper.status) {
        _showDialog(context, 'Failed', 'Donations failed please try again');
      } else {
        _showDialog(context, 'Success', 'Donation done successfully.');
      }
    }

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
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'D',
                    style: TextStyle(color: Colors.pink, fontSize: 50),
                  ),
                  Text(
                    'onate',
                    style: TextStyle(color: Colors.black, fontSize: 50),
                  ),
                ],
              ),
              Card(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.pink,
                        size: MediaQuery.of(context).size.height/2,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                                'Details : ',
                                style: TextStyle(color: Colors.pink, fontSize: 25),
                              ),
                              Text(
                            (list[index]['student_details']).toString(),
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Amount :',
                            style: TextStyle(color: Colors.pink, fontSize: 25),
                          ),
                          Container(
                              height: 100,
                              width: 100,
                              child: Center(
                                  child: Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter donation amount';
                                          }
                                          return null;
                                        },
                                        controller: amountController,
                                      )))),
                          Text(
                            'SDG',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ],
                      ),
                      DropdownButton<String>(
                        dropdownColor: Colors.pink,
                        hint: Text(
                          "Payment Method",
                          style: TextStyle(fontSize: 25),
                        ),
                        //value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.pink,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {});
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
                            MaterialPageRoute(
                                builder: (context) => Cases(username)),
                          );
                        },
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.height / 3,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.pink),
                            ),
                            child: Text('Donate'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _onPressed(context);
                              }
                            },
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
