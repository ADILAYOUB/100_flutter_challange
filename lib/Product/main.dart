import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Restaurant {
  final String name;
  final String cuisine;
  final double rating;
  final double distance;
  final String priceRange;

  Restaurant({
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.distance,
    required this.priceRange,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const RestaurantSearch(),
    );
  }
}

class RestaurantSearch extends StatefulWidget {
  const RestaurantSearch({super.key});
  @override
  State<RestaurantSearch> createState() => _RestaurantSearchState();
}

class _RestaurantSearchState extends State<RestaurantSearch> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<Restaurant> _filteredRestaurants = [];

  final List<Restaurant> _restaurants = [
    Restaurant(
        name: 'Restaurant 1',
        cuisine: 'Italian',
        rating: 4.5,
        distance: 2.5,
        priceRange: "400"),
    Restaurant(
        name: 'Restaurant 2',
        cuisine: 'India',
        rating: 4.2,
        distance: 6.5,
        priceRange: "\$"),
    Restaurant(
        name: 'Restaurant 3',
        cuisine: 'Mc Donald\'s',
        rating: 3.9,
        distance: 12.5,
        priceRange: "500"),
    Restaurant(
        name: 'Restaurant 4',
        cuisine: 'KFC',
        rating: 4.1,
        distance: 200.5,
        priceRange: "200"),
    Restaurant(
        name: 'Restaurant 5',
        cuisine: 'Malaysian',
        rating: 4,
        distance: 10.5,
        priceRange: "100"),
    // Add more restaurant data
  ];

  void _search() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
      _filteredRestaurants = _restaurants
          .where((restaurant) =>
              restaurant.name.toLowerCase().contains(_searchQuery) ||
              restaurant.cuisine.toLowerCase().contains(_searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (_) => _search(),
              decoration: const InputDecoration(
                labelText: 'Search by name or cuisine',
              ),
            ),
            const SizedBox(height: 16),
            // Add filter widgets here (e.g., rating, distance, price range)
            Expanded(
              child: ListView.builder(
                itemCount: _filteredRestaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = _filteredRestaurants[index];
                  return ListTile(
                    title: Text(restaurant.name),
                    subtitle: Text(
                        'Cuisine: ${restaurant.cuisine} and Price:\$ ${restaurant.priceRange}'),
                    trailing:
                        Text('Rating: ${restaurant.rating.toStringAsFixed(1)}'),
                    // Add more restaurant details
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
