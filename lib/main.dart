import 'package:delivery_app_pro/login%20registration/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'user/cart/cart_page.dart';
import 'user/food_info/Info_Page.dart';
import 'user/profile/profile_page.dart';
import 'user/profile/Profile_edit.dart';
import 'user/profile/profile.dart';
import 'user/home/home_page.dart';
import 'user/settings/settings_page.dart';
import 'login registration/login.dart';



void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User_profile()),
       // ChangeNotifierProvider(create: (context) => CounterModel()),
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
      initialRoute: '/sign_in',
      routes: {
        '/sign_in': (context) => LoginPage(),
        '/profile': (context) => Profile_page(),
        '/edit': (context) => Profile_edit(),
        '/home': (context) =>  Scaffold(body:Home_page()),
        '/food_info': (context) => MealCardPage(),
        '/cart': (context) => CartPage(),
        '/settings': (context) => SettingsPage(),


      },
    );
  }
}