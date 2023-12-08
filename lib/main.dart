import 'package:delivery_app_pro/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'food_info.dart';
import 'info_page.dart';
import 'profile/profile_page.dart';
import 'profile/Profile_edit.dart';
import 'profile/Profile.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User_profile()),
        ChangeNotifierProvider(create: (context) => CounterModel()),
      ],
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
      initialRoute: '/home',
      routes: {
        '/profile': (context) => Profile_page(),
        '/edit': (context) => Profile_edit(),
        '/home': (context) =>  Scaffold(body:Home_page()),
        '/food_info': (context) => info_page(),
      },
    );
  }
}