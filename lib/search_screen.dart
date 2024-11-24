import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> products = [
    {"title": "Apple", "description": "A healthy and tasty fruit.", "image": "assets/apple.jpg"},
    {"title": "Salad", "description": "Perfect for a balanced diet.", "image": "assets/salad.jpg"},
    {"title": "Soup", "description": "Nutritious and warm.", "image": "assets/soup.jpg"},
    {"title": "Pumpkin", "description": "Seasonal pumpkin delight.", "image": "assets/pumpkin.jpg"},
    {"title": "Hot Chocolate", "description": "Perfect for cold weather.", "image": "assets/hot_chocolate.jpg"},
  ];

  List<Map<String, String>> _searchResults = [];

  void _searchProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults = [];
      } else {
        _searchResults = products
            .where((product) =>
                product["title"]!.toLowerCase().contains(query.toLowerCase()) ||
                product["description"]!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.jpg"), // Replace with user's profile image
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for products...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchResults.clear();
                          });
                        },
                      )
                    : null,
              ),
              onChanged: _searchProducts,
            ),
            SizedBox(height: 20),
            // Search Results
            Expanded(
              child: _searchResults.isEmpty
                  ? Center(
                      child: Text(
                        _searchController.text.isEmpty
                            ? "Start typing to search for products."
                            : "No results found.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final product = _searchResults[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: Image.asset(
                              product["image"]!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(product["title"]!),
                            subtitle: Text(product["description"]!),
                          ),
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
