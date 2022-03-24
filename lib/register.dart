import 'package:flutter/material.dart';
import 'package:training/cases.dart';
import 'package:training/welcom.dart';

class Register extends StatelessWidget {
   
  final _formKey = GlobalKey<FormState>();  @override

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("The",style: TextStyle(fontSize: 60),),
                    Text("Red",style: TextStyle(fontSize: 60,color: Colors.pink),),
                    Text("Pen",style: TextStyle(fontSize: 60),),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                  children: [
                    Padding(
  padding: const EdgeInsets.all(15),
  child: TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
              hintText: 'Enter valid username'),
              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
              Padding(
  padding: const EdgeInsets.all(15),
  child: TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              hintText: 'Enter valid email id as abc@gmail.com'),
              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
              Padding(
  padding: const EdgeInsets.all(15),
  child: TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'password',
              hintText: 'Enter valid password'),
              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
              Padding(
                padding: const EdgeInsets.all(15),
              child: TextFormField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Comfirm password',
              hintText: 'Reenter your password'),
              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),

Padding(
  padding: const EdgeInsets.all(15),
  child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone number',
              hintText: 'Enter your phone number'),
           validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ),
              GestureDetector(
                onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Welcome()),
  );
},child:Container(
                  margin: EdgeInsets.all(20),
                  child: Text('You already have account? Login now',
                  style:TextStyle(fontSize: 20,color: Colors.blueAccent) ,),
                ),
                    ),
              GestureDetector(
                  onTap: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Cases()),
  );

                  print('Register now');}
                    },
                  
                
                  child: Container(
                    child: Center(child: Text("Register",style: TextStyle(fontSize: 50,color: Colors.white),)),
                    height: MediaQuery.of(context).size.height/10,
                    width: MediaQuery.of(context).size.height/2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.pink
                    ),
                  ),
                ),
                  ],
                )),
              
              ],
            ),
          ),
        ],
      ));
  }
}