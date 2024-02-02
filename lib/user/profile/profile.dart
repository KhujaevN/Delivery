import 'package:flutter/material.dart';

class User_profile with ChangeNotifier {
  String name = 'Micheal Jackson';
  String date_of_birth = '29/08/1958';
  String location = 'Tashkent , Uzbekistan';
  String email = 'WW@gmail.com';
  String phone = '+998 99 999 99 99';

  void updateProfile({
    String? newName,
    String? newDOB,
    String? newLocation,
    String? newEmail,
    String? newPhone,
  }) {
    name = newName ?? name;
    date_of_birth = newDOB ?? date_of_birth;
    location = newLocation ?? location;
    email = newEmail ?? email;
    phone = newPhone ?? phone;

    notifyListeners();
  }
}
