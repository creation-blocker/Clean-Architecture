  import 'package:chat_message/features/auth/domain/entities/user.dart';
  import 'package:flutter/material.dart';

  class UserProfilePage extends StatelessWidget {
    final User user;
    const UserProfilePage({super.key, required this.user});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.image),
                ),
              ),
              const SizedBox(height: 16),
              // Name and Job Title
              Center(
                child: Text(
                  "${user.firstName} ${user.lastName}",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  user.email,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 24),
              // Contact Info Fields
              buildTextField("Your Email", user.email),
              buildTextField("Password", "********", obscureText: true),
              const SizedBox(height: 24),
              // Edit Profile Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality to edit profile
                  },
                  child: const Text("Edit Profile"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    }

    Widget buildTextField(String label, String value, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: value,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
  }