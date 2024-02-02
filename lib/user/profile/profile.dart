import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User_profile with ChangeNotifier {
  String name = '';
  String date_of_birth = '';
  String location = '';
  String email = '';
  String phone = '';

  User_profile() {
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      // Assuming 'user_profiles' is the collection name in Firestore
      final userProfileDoc = await FirebaseFirestore.instance
          .collection('user_profiles')
          .doc('user_id') // Replace with the actual user ID
          .get();

      if (userProfileDoc.exists) {
        final userProfileData = userProfileDoc.data() as Map<String, dynamic>;

        name = userProfileData['name'] ?? '';
        date_of_birth = userProfileData['date_of_birth'] ?? '';
        location = userProfileData['location'] ?? '';
        email = userProfileData['email'] ?? '';
        phone = userProfileData['phone'] ?? '';

        notifyListeners();
      }
    } catch (error) {
      print('Error fetching user profile: $error');
      // Handle error as needed (e.g., show an error message to the user)
    }
  }

  void updateProfile({
    String? newName,
    String? newDOB,
    String? newLocation,
    String? newEmail,
    String? newPhone,
  }) async {
    try {
      // Assuming 'user_profiles' is the collection name in Firestore
      final userProfileDoc = await FirebaseFirestore.instance
          .collection('user_profiles')
          .doc('user_id') // Replace with the actual user ID
          .get();

      if (userProfileDoc.exists) {
        final userProfileData = userProfileDoc.data() as Map<String, dynamic>;

        name = newName ?? userProfileData['name'] ?? '';
        date_of_birth = newDOB ?? userProfileData['date_of_birth'] ?? '';
        location = newLocation ?? userProfileData['location'] ?? '';
        email = newEmail ?? userProfileData['email'] ?? '';
        phone = newPhone ?? userProfileData['phone'] ?? '';

        notifyListeners();
      }
    } catch (error) {
      print('Error updating user profile: $error');
      // Handle error as needed (e.g., show an error message to the user)
    }
  }
}
