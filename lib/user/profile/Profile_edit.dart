import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile.dart';

class Profile_edit extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userProfile = Provider.of<User_profile>(context);

    // Set initial values
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
              // TextFormField widgets...

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  userProfile.updateProfile(
                    newName: nameController.text,
                    newDOB: dobController.text,
                    newLocation: locationController.text,
                    newEmail: emailController.text,
                    newPhone: phoneController.text,
                  );

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
