import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'food_info.dart';
import 'main.dart';

class info_page extends StatelessWidget {
  const info_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/salad.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              'Mixed Vegetable Salad',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'This vegetable salad is a healthy and delicious summer salad'
                  'made with fresh raw veggies, avocado, nuts, herbs, seeds'
                  'and feta in a light ...',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon:
                  const Icon(Icons.remove),
                  color: Colors.green,
                  onPressed: () {
                    Provider.of<CounterModel>(context, listen: false).decrement();
                  },
                ),
                Consumer<CounterModel>(
                  builder: (context, counterModel, _) => Text(
                    '${counterModel.counter}',
                    style:
                    const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                IconButton(
                  icon:
                  const Icon(Icons.add),
                  color: Colors.green,
                  onPressed: () {
                    Provider.of<CounterModel>(context, listen: false).increment();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                hintText: 'Note to Restaurant (optional)',
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.green
              ),
              onPressed: () {
                // Add your button action here
              },
              child:
              const Text('Add to Basket - \$12.00', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}