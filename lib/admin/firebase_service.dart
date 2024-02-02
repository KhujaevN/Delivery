// firebase_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'restaurant_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Restaurant>> fetchRestaurants() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore.collection('restaurants').get();
    return snapshot.docs.map((doc) => Restaurant.fromMap(doc.data())).toList();
  }

  Future<void> registerRestaurant(Restaurant restaurant) async {
    await _firestore.collection('restaurants').add(restaurant.toMap());
  }

  Future<List<Meal>> fetchMeals() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore.collection('meals').get();
    return snapshot.docs.map((doc) => Meal.fromMap(doc.data())).toList();
  }

  Future<void> addMeal(Meal meal) async {
    await _firestore.collection('meals').add(meal.toMap());
  }
}
