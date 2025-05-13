import 'package:flutter/material.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen(this.login, {super.key});

  final void Function() login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          //--- Language button ---
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.language),
            iconSize: 26,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //--- Email Input ---
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter your email"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //--- Password Input ---
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter your password"),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //--- Login Button ---
              SizedBox(
                width: 320,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B98C6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
