import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool receivePushNotifications = false;
  bool receiveEmailNotifications = false;

  @override
  void initState() {
    super.initState();
    _fetchUserSettings();
  }

  Future<void> _fetchUserSettings() async {
    try {
      // Replace 'users' with your actual Firestore collection name
      // and 'userId' with the actual user's ID
      final DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('userId')
          .get();

      final userData = userSnapshot.data() as Map<String, dynamic>;

      setState(() {
        receivePushNotifications = userData['receivePushNotifications'] ?? false;
        receiveEmailNotifications = userData['receiveEmailNotifications'] ?? false;
      });
    } catch (error) {
      print('Error fetching user settings: $error');
    }
  }

  Future<void> _updateUserSettings() async {
    try {
      // Replace 'users' with your actual Firestore collection name
      // and 'userId' with the actual user's ID
      await FirebaseFirestore.instance.collection('users').doc('userId').update({
        'receivePushNotifications': receivePushNotifications,
        'receiveEmailNotifications': receiveEmailNotifications,
      });
    } catch (error) {
      print('Error updating user settings: $error');
    }
  }

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
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                Navigator.pushNamed(context, '/edit_profile');
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
              value: receivePushNotifications,
              onChanged: (bool value) {
                setState(() {
                  receivePushNotifications = value;
                });
                _updateUserSettings();
              },
            ),
            SwitchListTile(
              title: Text('Receive Email Notifications'),
              value: receiveEmailNotifications,
              onChanged: (bool value) {
                setState(() {
                  receiveEmailNotifications = value;
                });
                _updateUserSettings();
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,'/sign_in');
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
