import 'package:flutter/material.dart';
import 'my_cart.dart';
import 'meal.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Delivery App',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            navigateToMyCart(context);
          },
          child: const Text('View My Cart'),
        ),
      ),
    );
  }

  void navigateToMyCart(BuildContext context) {
    // Assume you have a list of ordered meals
    List<Meal> orderedMeals = [
      Meal(
          name: 'Salad',
          price: 3.99,
          imageAssetPath: 'assets/images/salad.png'),
      Meal(
          name: 'Palov',
          price: 20.99,
          imageAssetPath: 'assets/images/palov.jpg'),

      // Add more meals as needed
    ];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyCart(orderedMeals: orderedMeals),
      ),
    );
  }
}
