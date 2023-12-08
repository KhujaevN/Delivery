import 'package:delivery_app_pro/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile/profile_page.dart';
import 'profile/Profile_edit.dart';
import 'profile/Profile.dart';
import 'home_page.dart';

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
      title: 'Delivery',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(body: Home_page()),
        '/profile':(context) => Profile_page(),
        '/edit': (context) => Profile_edit(),
        '/home': (context) => Scaffold(body: Home_page()),
      },
    );
  }
}
