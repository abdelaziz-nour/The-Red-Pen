import 'dart:core';

import 'package:flutter/material.dart';
import 'package:training/LoginPage.dart';
import 'package:training/apiModels/my_api.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _RegisterformKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  void _showDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text('Failed'),
              content: new Text(
                  'Username must be unique and email should be like abc@abc.abc'),
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
    await _databaseHelper.registerData(
        usernameController.text.trim(),
        emailController.text.trim(),
        passwordController.text,
        fNameController.text.trim(),
        lNameController.text.trim());
    if (_databaseHelper.status ||
        _databaseHelper.loginUsernameStatus ||
        _databaseHelper.loginEmailStatus ||
        _databaseHelper.loginEmailStatus1) {
      _showDialog(context);
    } else
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => Welcome(),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'R',
                        style: TextStyle(fontSize: 30, color: Colors.pink),
                      ),
                      Text(
                        'egister',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: _RegisterformKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'username',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: usernameController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'email'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter you Email';
                              }
                              return null;
                            },
                            controller: emailController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'password'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: passwordController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'first name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: fNameController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'last name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: lNameController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.height / 3,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.pink),
                              ),
                              child: Text('Register'),
                              onPressed: () {
                                if (_RegisterformKey.currentState!.validate()) {
                                  _onPressed(context);
                                }
                              },
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Welcome()),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18, color: Colors.pink),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
