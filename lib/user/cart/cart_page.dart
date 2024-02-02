import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> _cartItems = [
    CartItem(
      name: 'Item 1',
      description: 'Description of Item 1',
      price: 10.0,
      quantity: 2,
      imageUrl: 'assets/samsa.png',
    ),
    CartItem(
      name: 'Item 2',
      description: 'Description of Item 2',
      price: 15.0,
      quantity: 1,
      imageUrl: 'assets/samsa.png',
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          CartItem cartItem = _cartItems[index];

          return Dismissible(
            key: Key(cartItem.name),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) {
              // Handle dismiss if needed
            },
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                // Show delete confirmation dialog
                return await _showDeleteConfirmation();
              } else if (direction == DismissDirection.startToEnd) {
                // Show order confirmation dialog
                return await _showOrderConfirmation();
              }
              return false;
            },
            background: Container(
              color: Colors.green,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Icon(Icons.shopping_cart, color: Colors.white),
                ),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ),
            child: Card(
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      cartItem.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'x${cartItem.quantity}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                title: Text(cartItem.name),
                subtitle: Text(cartItem.description),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${cartItem.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Delivery to: Your Address'), // Replace with actual delivery address
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool?> _showDeleteConfirmation() async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure you want to delete this item from the cart?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> _showOrderConfirmation() async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Order'),
          content: Text('Do you want to place an order for this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}

class CartItem {
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}
