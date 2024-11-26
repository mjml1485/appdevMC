import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(SmartSwapApp());
}

class SmartSwapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Swap',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: NavigationScreen(),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 1; // Default to HomeScreen

  // List of screens for navigation
  final List<Widget> _screens = [
    FavoritesScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  // List of titles for the AppBar
  final List<String> _titles = [
    "Favorites",
    "Smart Swap",
    "Profile",
  ];

  // Handle bottom navigation bar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        actions: [
          // Profile Picture
          if (_selectedIndex != 2) // Hide in Profile screen since it has its own profile picture
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/profile.jpg"), // Replace with actual user image
              ),
            ),
        ],
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green, // Highlighted icon color
        unselectedItemColor: Colors.grey, // Default icon color
      ),
    );
  }
}
