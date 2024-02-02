// restaurant_model.dart

import 'package:flutter/material.dart';
import 'firebase_service.dart';

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> _restaurants = [];

  List<Restaurant> get restaurants => _restaurants;

  Future<void> registerRestaurant(Restaurant restaurant) async {
    // Add restaurant to Firebase
    await FirebaseService().registerRestaurant(restaurant);

    // Update local state
    _restaurants.add(restaurant);
    notifyListeners();
  }
}

class MealProvider with ChangeNotifier {
  List<Meal> _meals = [];

  List<Meal> get meals => _meals;

  Future<void> addMeal(Meal meal) async {
    // Add meal to Firebase
    await FirebaseService().addMeal(meal);

    // Update local state
    _meals.add(meal);
    notifyListeners();
  }
}

class Restaurant {
  final String name;
  final String description;
  final String location;
  final String workingTimes;
  final String imageUrl;


  Restaurant({
    required this.name,
    required this.description,
    required this.location,
    required this.workingTimes,
    required this.imageUrl,
  });

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      location: map['location'] ?? '',
      workingTimes: map['workingTimes'] ?? '',
      imageUrl: map['imageUrl'] ?? '',

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'location': location,
      'workingTimes': workingTimes,
      'imageUrl': imageUrl,
    };
  }
}

class Meal {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;


  Meal({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: map['imageUrl'] ?? '', category: map['category'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
    };
  }
}
