import 'package:flutter/material.dart';

class User_profile with ChangeNotifier {
  String name = 'John Doe';
  String role = 'Web Developer';
  String location = 'New York, USA';
  String email = 'john.doe@example.com';
  String phone = '+1 123-456-7890';

  void updateProfile({
    String? newName,
    String? newRole,
    String? newLocation,
    String? newEmail,
    String? newPhone,
  }) {
    name = newName ?? name;
    role = newRole ?? role;
    location = newLocation ?? location;
    email = newEmail ?? email;
    phone = newPhone ?? phone;

    notifyListeners();
  }
}
