import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile/profile_page.dart';
import 'profile/Profile_edit.dart';
import 'profile/Profile.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => User_profile(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => Profile_page(),
        '/edit': (context) => Profile_edit(),
      },
    );
  }
}
