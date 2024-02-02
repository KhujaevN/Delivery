import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home_page extends StatefulWidget {
  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  List<Map<String, dynamic>> _meals = [];

  Future<void> _searchMeals(String query) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('meals')
        .where('name', isGreaterThanOrEqualTo: query)
        .get();

    setState(() {
      _meals = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          color: Color(0xFF181A20),
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // Existing code...
              ),
              SizedBox(height: 13),
              Container(
                width: 380,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: ShapeDecoration(
                  color: Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: TextField(
                  onChanged: (query) => _searchMeals(query),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xFFBDBDBD),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.symmetric(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 200.0,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 1,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 10),
                          autoPlayAnimationDuration:
                          Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: [
                          // Your popular carousel items...
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                itemCount: _meals.length,
                itemBuilder: (context, index) {
                  final meal = _meals[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/food_info', arguments: meal);
                    },
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        child: Image.network(
                          meal['imageUrl'], // Update with the actual field in Firestore
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        meal['name'], // Update with the actual field in Firestore
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(Icons.directions_car, color: Color(0xFF1BAC4B)),
                          SizedBox(width: 5),
                          Text(
                            '${meal['deliveryTime']} min', // Update with the actual field in Firestore
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      trailing: Text(
                        '${meal['price']} Sum', // Update with the actual field in Firestore
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1BAC4B),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          // Handle navigation based on index
          switch (index) {
            case 0:
            // Home
              break;
            case 1:
            // Cart
              Navigator.pushNamed(context, '/cart');
              break;
            case 2:
            // Orders
              Navigator.pushNamed(context, '/settings');
              break;
            case 3:
            // Profile
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
