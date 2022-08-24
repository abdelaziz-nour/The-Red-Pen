import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training/apiModels/my_api.dart';

import 'package:training/main.dart';

void main() {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  test('test loging in finction', () async {
    print(_databaseHelper.status);
    await _databaseHelper.loginData('test', '123456');
    //null = no log in attempt
    //flase = no error
    //true = error happened
    expect(_databaseHelper.status, false);
  });

  test('Gaetting students info from API', () async {
    await _databaseHelper.loginData('test', '123456');

    var students = await _databaseHelper.getStudents();
    expect(students[1]['student_semester'], 3);
  });

  test('test donation function', () async {
    await _databaseHelper.loginData('test', '123456');
    _databaseHelper.donate(1, 150);
    //null = no donate attempt
    //flase = no error
    //true = error happened
    expect(_databaseHelper.status, false);
  });
}
