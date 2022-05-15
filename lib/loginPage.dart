import 'package:flutter/material.dart';
import 'package:training/admin_casesPage.dart';
import 'package:training/apiModels/my_api.dart';
import 'package:training/casesPage.dart';
import 'package:training/receivedDonationPage.dart';
import 'package:training/registerPage.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);

  final _LoginformKey = GlobalKey<FormState>();
  final _formkeySudent = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final idController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  static bool checker = false;

  void _showDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text('Failed'),
              content: new Text('Incorrect email or password.'),
              actions: <Widget>[
                new ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: new Text(
                      'Close',
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  _onPressed(context) async {
    await _databaseHelper.loginData(
        usernameController.text.trim(), passwordController.text);
    if (_databaseHelper.status) {
      _showDialog(context);
    } else
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => Cases(
            usernameController.text.trim(),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Image.asset('lib/logoo.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "The",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 15),
                ),
                Text(
                  "Red",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 15,
                      color: Colors.pink),
                ),
                Text(
                  "Pen",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 15),
                ),
              ],
            ),
            Form(
                key: _LoginformKey,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                              hintText: 'Enter valid username '),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You Don\'t have an account ? ',
                            style: TextStyle(fontSize: 18),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                );
                              },
                              child: Text(
                                'Register',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.pink),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.height / 3,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.pink),
                        ),
                        child: Text('Login'),
                        onPressed: () {
                          if (_LoginformKey.currentState!.validate()) {
                            _onPressed(context);
                          }
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminCases('Admin')),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          'Admin',
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    Form(
                        key: _formkeySudent,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: idController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'ID',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter  Student ID';
                                }
                                return null;
                              },
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (_formkeySudent.currentState!.validate()) {
                                  List students =
                                      await _databaseHelper.getStudents();
                                  for (var map in students) {
                                    if (map["id"] ==
                                        int.parse(idController.text.trim())) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReceivedDonations(
                                                  'Student',
                                                  int.parse(
                                                      idController.text.trim()),
                                                )),
                                      );
                                      checker = true;
                                      break;
                                    }
                                  }
                                  if (checker == false) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              title: new Text('Failed'),
                                              content: new Text(
                                                  'Invalid student ID'),
                                              actions: <Widget>[
                                                new ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.pink),
                                                    child: new Text(
                                                      'Close',
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Welcome()),
                                                      );
                                                    })
                                              ]);
                                        });
                                  }
                                  checker = false;
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  'Student',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blueAccent),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                )),
          ],
        ),
      ],
    ));
  }
}
