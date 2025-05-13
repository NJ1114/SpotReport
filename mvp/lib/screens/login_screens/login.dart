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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //--- Email Input ---
            TextField(
              decoration: InputDecoration(
                label: Text(
                  "Enter your email",
                ),
              ),
            ),
            //--- Password Input ---
            TextField(
              decoration: InputDecoration(
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
                  backgroundColor: const Color.fromARGB(255, 59, 152, 198),
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
    );
  }
}
