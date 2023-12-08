import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Profile.dart';

class Profile_edit extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userProfile = Provider.of<User_profile>(context);

    nameController.text = userProfile.name;
    dobController.text = userProfile.date_of_birth;
    locationController.text = userProfile.location;
    emailController.text = userProfile.email;
    phoneController.text = userProfile.phone;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(labelText: 'Date of birth'),
              ),
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Update the profile information
                  userProfile.updateProfile(
                    newName: nameController.text,
                    newDOB: dobController.text,
                    newLocation: locationController.text,
                    newEmail: emailController.text,
                    newPhone: phoneController.text,
                  );
                  // Go back to the profile page
                  Navigator.pop(context, true);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
