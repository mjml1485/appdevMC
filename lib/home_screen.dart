import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> featuredProducts = [
    {"title": "Apple", "description": "A healthy and tasty fruit.", "image": "assets/apple.jpg"},
    {"title": "Salad", "description": "Perfect for a balanced diet.", "image": "assets/salad.jpg"},
    {"title": "Soup", "description": "Nutritious and warm.", "image": "assets/soup.jpg"},
    {"title": "Banana", "description": "Rich in potassium.", "image": "assets/banana.jpg"},
    {"title": "Orange", "description": "Full of Vitamin C.", "image": "assets/orange.jpg"},
  ];

  final List<Map<String, String>> seasonalRecommendations = [
    {"title": "Pumpkin", "description": "Seasonal pumpkin delight.", "image": "assets/pumpkin.jpg"},
    {"title": "Hot Chocolate", "description": "Perfect for cold weather.", "image": "assets/hot_chocolate.jpg"},
    {"title": "Strawberry", "description": "Sweet and refreshing.", "image": "assets/strawberry.jpg"},
    {"title": "Mango", "description": "Juicy and tropical.", "image": "assets/mango.jpg"},
  ];

  List<Map<String, String>> searchResults = [];

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        searchResults = [];
      } else {
        searchResults = featuredProducts
            .where((product) =>
                product["title"]!.toLowerCase().contains(query.toLowerCase()) ||
                product["description"]!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showProductDetails(BuildContext context, Map<String, String> product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(product["title"]!),
          content: Text(product["description"]!),
          actions: [
            IconButton(
              onPressed: () {
                // TODO: Add to favorites functionality
                Navigator.pop(context);
              },
              icon: Icon(Icons.favorite, color: Colors.red),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search for products...",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: _performSearch,
              ),
            ),
            // Search Results or Categories and Products
            Expanded(
              child: searchResults.isNotEmpty
                  ? ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final product = searchResults[index];
                        return ListTile(
                          leading: Image.asset(
                            product["image"]!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(product["title"]!),
                          subtitle: Text(product["description"]!),
                        );
                      },
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          // Featured Products Section
                          _buildSection("Featured Products", featuredProducts),
                          // Seasonal Recommendations Section
                          _buildSection("Seasonal Recommendations", seasonalRecommendations),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, String>> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 10.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: GestureDetector(
                  onTap: () => _showProductDetails(context, product),
                  child: Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            product["image"]!,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            product["title"]!,
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
