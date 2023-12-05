import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xFF181A20),
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.28),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: const Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('../images/profile-logo.png'), // Use the user's image path here
                ),
                SizedBox(width: 15.0),
                Expanded(
                  child: Text(
                    'Sharof Rashidov street', // Replace with the user's address
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

        ],
      )
    ),
    );
  }
}
