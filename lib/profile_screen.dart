import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.green, // Adjust color to match your theme
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              // Profile Picture
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/profile.jpg"), // Replace with user's profile image
                backgroundColor: Colors.grey.shade200,
              ),
              SizedBox(height: 20),
              // Name and Email
              Text(
                "Coco Martin",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "cocomartin@example.com",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              // Edit Profile Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement Edit Profile functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Edit Profile", style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 30),
              // Divider
              Divider(thickness: 1),
              SizedBox(height: 10),
              // Menu Options
              ListTile(
                leading: Icon(Icons.history, color: Colors.green),
                title: Text("Order History"),
                onTap: () {
                  // TODO: Navigate to Order History
                },
              ),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.green),
                title: Text("Settings"),
                onTap: () {
                  // TODO: Navigate to Settings
                },
              ),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text("Log Out"),
                onTap: () {
                  // TODO: Implement Log Out functionality
                  _showLogoutConfirmation(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Log Out"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // TODO: Perform log-out actions
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text("Log Out"),
            ),
          ],
        );
      },
    );
  }
}
