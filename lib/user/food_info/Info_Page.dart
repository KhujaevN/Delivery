import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }
}

class MealCardPage extends StatefulWidget {
  @override
  _MealCardPageState createState() => _MealCardPageState();
}

class _MealCardPageState extends State<MealCardPage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 3; // Start from the middle section
  List<MealCard> _selectedMeals = [];
  List<String> sectionNames = [
    "Section 0",
    "Section 1",
    "Section 2",
    "Section 3",
    "Section 4",
    "Section 5"
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onScroll);
  }

  void _onScroll() {
    final double page = _pageController.page ?? 0.0;
    int newPage = page.round();
    if (newPage != _currentPage) {
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  void _addToCart(MealCard mealCard) {
    setState(() {
      _selectedMeals.add(mealCard);
    });
  }

  void _removeFromCart(MealCard mealCard) {
    setState(() {
      _selectedMeals.remove(mealCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Cards'),
      ),
      body: Column(
        children: [
          // Top Scroll Bar
          Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: sectionNames.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      int distance = (index - _currentPage).abs();
                      _pageController.animateToPage(
                        index,
                        duration: Duration(
                            milliseconds: (distance * 200).clamp(500, 2000)),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.blue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          sectionNames[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: _currentPage == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Meal Cards
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: sectionNames.length,
              itemBuilder: (context, sectionIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sectionNames[sectionIndex],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, mealIndex) {
                          MealCard mealCard = MealCard(
                            image: 'assets/salad.png',
                            title:
                                'Meal ${(sectionIndex * 10) + mealIndex + 1}',
                            description:
                                'Description of meal ${(sectionIndex * 10) + mealIndex + 1}',
                            price: 12.00,
                            sectionIndex: sectionIndex,
                          );

                          return GestureDetector(
                            onTap: () {
                              if (_selectedMeals.contains(mealCard)) {
                                _removeFromCart(mealCard);
                              } else {
                                _addToCart(mealCard);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: _selectedMeals.contains(mealCard)
                                    ? Border.all(color: Colors.blue, width: 2.0)
                                    : null,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: mealCard,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomSheet: _selectedMeals.isNotEmpty
          ? Container(
              height: 100,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price: \$${_selectedMeals.fold<double>(0.0, (sum, meal) => sum + meal.price)}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Place your logic to proceed with the order
                        print('Order Placed!');
                        setState(() {
                          _selectedMeals.clear();
                        });
                      },
                      child: Text('Place Order'),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

class MealCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final double price;
  final int sectionIndex;

  const MealCard({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.sectionIndex,
  });

  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              // Add your logic for tapping the meal card (if needed)
            },
            child: Image.asset(
              widget.image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(widget.description),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.price.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_quantity > 0) {
                                _quantity--;
                              }
                            });
                          },
                          child: Icon(Icons.remove, size: 20),
                        ),
                        SizedBox(width: 8),
                        Text('$_quantity'),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _quantity++;
                            });
                          },
                          child: Icon(Icons.add, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
