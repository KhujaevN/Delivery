import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile.dart';

class Profile_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProfile = Provider.of<User_profile>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(context, '/edit');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircleAvatar and other widgets...

            SizedBox(height: 16),
            _buildInfoCard('Location', userProfile.location),
            _buildInfoCard('Email', userProfile.email),
            _buildInfoCard('Phone', userProfile.phone),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(value),
      ),
    );
  }
}
