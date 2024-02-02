import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MealOrderPage extends StatefulWidget {
  final String mealId;

  MealOrderPage({required this.mealId});

  @override
  _MealOrderPageState createState() => _MealOrderPageState();
}

class _MealOrderPageState extends State<MealOrderPage> {
  late Map<String, dynamic> mealData;
  int counter = 1;

  @override
  void initState() {
    super.initState();
    _fetchMealData();
  }

  Future<void> _fetchMealData() async {
    try {
      // Replace 'meals' with your actual Firestore collection name
      final DocumentSnapshot mealSnapshot = await FirebaseFirestore.instance
          .collection('meals')
          .doc(widget.mealId)
          .get();

      setState(() {
        mealData = mealSnapshot.data() as Map<String, dynamic>;
      });
    } catch (error) {
      print('Error fetching meal data: $error');
    }
  }

  void _addToCart() async {
    try {
      // Replace 'cart' with your actual Firestore collection name
      await FirebaseFirestore.instance.collection('cart').add({
        'mealId': widget.mealId,
        'quantity': counter,
      });

      // Show a snackbar to indicate successful addition to cart
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added to Cart!'),
        ),
      );
    } catch (error) {
      print('Error adding to cart: $error');
    }
  }

  void _placeOrder() {
    // Handle placing order, you can navigate to a new page or perform any other action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Order'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display meal image, description, price, and counter
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(mealData['imageUrl'] ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              mealData['name'] ?? '',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              mealData['description'] ?? '',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            SizedBox(height: 8.0),
            Text(
              'Price: ${mealData['price']} Sum',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            // Counter
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (counter > 1) {
                      setState(() {
                        counter--;
                      });
                    }
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(
                  '$counter',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Order and Add to Cart buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _placeOrder,
                  child: Text('Order'),
                ),
                ElevatedButton(
                  onPressed: _addToCart,
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
