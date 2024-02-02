import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Edit Profile'),
              onTap: () {
                // Navigate to the edit profile page
                Navigator.pushNamed(context, '/edit_profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                // Navigate to the change password page
                Navigator.pushNamed(context, '/change_password');
              },
            ),
            SizedBox(height: 24),
            Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            SwitchListTile(
              title: Text('Receive Push Notifications'),
              value: true, // Replace with actual value from user preferences
              onChanged: (bool value) {
                // Update user preferences for push notifications
              },
            ),
            SwitchListTile(
              title: Text('Receive Email Notifications'),
              value: true, // Replace with actual value from user preferences
              onChanged: (bool value) {
                // Update user preferences for email notifications
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Perform logout or any other action on button press
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
