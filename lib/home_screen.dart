import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> featuredProducts = [
    {"title": "Apple", "description": "A healthy and tasty fruit.", "image": "assets/apple.jpg"},
    {"title": "Salad", "description": "Perfect for a balanced diet.", "image": "assets/salad.jpg"},
    {"title": "Soup", "description": "Nutritious and warm.", "image": "assets/soup.jpg"},
  ];

  final List<Map<String, String>> seasonalRecommendations = [
    {"title": "Pumpkin", "description": "Seasonal pumpkin delight.", "image": "assets/pumpkin.jpg"},
    {"title": "Hot Chocolate", "description": "Perfect for cold weather.", "image": "assets/hot_chocolate.jpg"},
  ];

  void _openCategoryScreen(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(category), centerTitle: true),
          body: Center(child: Text("$category details coming soon.")),
        ),
      ),
    );
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
      appBar: AppBar(
        title: Text("Smart Swap"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.jpg"), // Replace with actual user image
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Explore Button
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/banner.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement Explore functionality
                      },
                      child: Text("Explore"),
                    ),
                  ),
                ),
              ],
            ),
            // Categories Section
            GridView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final categories = [
                  "Dietary Preferences",
                  "Health Goals",
                  "Meal Types",
                  "Ingredients",
                  "Beverage Options",
                  "Pantry Staples",
                ];
                final images = [
                  "assets/dietary.jpg",
                  "assets/health.jpg",
                  "assets/meal.jpg",
                  "assets/ingredients.jpg",
                  "assets/beverage.jpg",
                  "assets/pantry.jpg",
                ];
                return GestureDetector(
                  onTap: () => _openCategoryScreen(context, categories[index]),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(images[index]),
                      ),
                      SizedBox(height: 8),
                      Text(categories[index], textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
            // Featured Products Section
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text("Featured Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuredProducts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _showProductDetails(context, featuredProducts[index]),
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(featuredProducts[index]["image"]!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton(onPressed: () {}, child: Text("See More")),
            // Seasonal Recommendations Section
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text("Seasonal Recommendations", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: seasonalRecommendations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _showProductDetails(context, seasonalRecommendations[index]),
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(seasonalRecommendations[index]["image"]!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton(onPressed: () {}, child: Text("See More")),
          ],
        ),
      ),
    );
  }
}
