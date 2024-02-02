import 'package:flutter/material.dart';

class DeliveryGuyPage extends StatefulWidget {
  @override
  _DeliveryGuyPageState createState() => _DeliveryGuyPageState();
}

class _DeliveryGuyPageState extends State<DeliveryGuyPage> {
  List<Reservation> _reservations = [
    Reservation(
      id: '1',
      customerName: 'John Doe',
      customerAddress: '123 Main St, Cityville',
      contactNumber: '555-1234',
    ),
    // Add more reservations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Guy Page'),
      ),
      body: ListView.builder(
        itemCount: _reservations.length,
        itemBuilder: (context, index) {
          Reservation reservation = _reservations[index];
          return ListTile(
            title: Text(reservation.customerName),
            subtitle: Text(reservation.customerAddress),
            trailing: IconButton(
              icon: Icon(Icons.map),
              onPressed: () {
                // Navigate to map page with reservation details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapPage(reservation: reservation),
                  ),
                );
              },
            ),
            onTap: () {
              // Perform contact action (e.g., call or message)
              _showContactDialog(reservation);
            },
          );
        },
      ),
    );
  }

  void _showContactDialog(Reservation reservation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Customer'),
          content: Text('How would you like to contact ${reservation.customerName}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Implement call functionality
                _makePhoneCall(reservation.contactNumber);
                Navigator.of(context).pop();
              },
              child: Text('Call'),
            ),
            TextButton(
              onPressed: () {
                // Implement message functionality
                _sendMessage(reservation.contactNumber);
                Navigator.of(context).pop();
              },
              child: Text('Message'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Placeholder functions for calling and messaging
  void _makePhoneCall(String phoneNumber) {
    // Implement call functionality
    // You can use packages like url_launcher to launch a phone call
  }

  void _sendMessage(String phoneNumber) {
    // Implement message functionality
    // You can use packages like url_launcher to launch a messaging app
  }
}

class MapPage extends StatelessWidget {
  final Reservation reservation;

  const MapPage({required this.reservation});

  @override
  Widget build(BuildContext context) {
    // Implement map functionality using packages like Google Maps Flutter
    // Display the customer's address and other details on the map
    // Return a Scaffold or other widget to build the map page
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Map'),
      ),
      body: Center(
        child: Text('Map Page for ${reservation.customerAddress}'),
      ),
    );
  }
}

class Reservation {
  final String id;
  final String customerName;
  final String customerAddress;
  final String contactNumber;

  Reservation({
    required this.id,
    required this.customerName,
    required this.customerAddress,
    required this.contactNumber,
  });
}
