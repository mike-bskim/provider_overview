import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class Dog with ChangeNotifier{
  final String name;
  final String breed;
  int age;

  Dog({
    required this.name,
    required this.breed,
    this.age = 1,
  });

  void grow() {
    age++;
    notifyListeners();
  }

}
