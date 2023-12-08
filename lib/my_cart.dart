import 'package:flutter/material.dart';
import 'meal.dart';

class MyCart extends StatelessWidget {
  final List<Meal> orderedMeals;

  const MyCart({Key? key, required this.orderedMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: ListView.builder(
        itemCount: orderedMeals.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SizedBox(
              width: 60.0, // Adjust width as needed
              height: 60.0, // Adjust height as needed
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                // Adjust the corner radius
                child: Image.asset(
                  orderedMeals[index].imageAssetPath,
                  fit: BoxFit.cover, // Adjust the fit property as needed
                ),
              ),
            ),
            title: Text(orderedMeals[index].name),
            subtitle: Text('Price: \$${orderedMeals[index].price.toString()}'),
            // You can customize the ListTile to display more information about the ordered meals
          );
        },
      ),
    );
  }
}
