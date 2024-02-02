import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'restaurant_model.dart';
import 'firebase_service.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
        ChangeNotifierProvider(create: (_) => MealProvider()),
      ],
      child: AdminPanelContent(),
    );
  }
}

class AdminPanelContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RestaurantForm(),
            SizedBox(height: 20),
            RestaurantList(),
            SizedBox(height: 20),
            MealForm(),
            SizedBox(height: 20),
            MealList(),
          ],
        ),
      ),
    );
  }
}

class RestaurantForm extends StatefulWidget {
  @override
  _RestaurantFormState createState() => _RestaurantFormState();
}

class _RestaurantFormState extends State<RestaurantForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _workingTimesController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Restaurant', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the description';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _locationController,
            decoration: InputDecoration(labelText: 'Location'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the location';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _workingTimesController,
            decoration: InputDecoration(labelText: 'Working Times'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the working times';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _imageUrlController,
            decoration: InputDecoration(labelText: 'Image URL'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the image URL';
              }
              return null;
            },
          ),

          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState?.validate() ?? false) {
                final restaurant = Restaurant(
                  name: _nameController.text,
                  description: _descriptionController.text,
                  location: _locationController.text,
                  workingTimes: _workingTimesController.text,
                  imageUrl: _imageUrlController.text,
                );
                await Provider.of<RestaurantProvider>(context, listen: false).registerRestaurant(restaurant);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Restaurant added successfully!'),
                  ),
                );
              }
            },
            child: Text('Add Restaurant'),
          ),
        ],
      ),
    );
  }
}

class RestaurantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurants = Provider.of<RestaurantProvider>(context).restaurants;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Restaurant List', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Expanded(
          child: ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return ListTile(
                title: Text(restaurant.name),
                subtitle: Text(restaurant.description),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MealForm extends StatefulWidget {
  @override
  _MealFormState createState() => _MealFormState();
}

class _MealFormState extends State<MealForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Meal', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the description';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _priceController,
            decoration: InputDecoration(labelText: 'Price'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the price';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _imageUrlController,
            decoration: InputDecoration(labelText: 'Image URL'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the image URL';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _categoryController,
            decoration: InputDecoration(labelText: 'Category'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the category';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState?.validate() ?? false) {
                final meal = Meal(
                  name: _nameController.text,
                  description: _descriptionController.text,
                  price: double.parse(_priceController.text),
                  imageUrl: _imageUrlController.text,
                  category: _categoryController.text,
                );
                await Provider.of<MealProvider>(context, listen: false).addMeal(meal);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Meal added successfully!'),
                  ),
                );
              }
            },
            child: Text('Add Meal'),
          ),
        ],
      ),
    );
  }
}

class MealList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<MealProvider>(context).meals;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Meal List', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Expanded(
          child: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return ListTile(
                title: Text(meal.name),
                subtitle: Text('Price: \$${meal.price.toString()}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
