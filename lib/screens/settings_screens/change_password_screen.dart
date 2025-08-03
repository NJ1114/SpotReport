import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  //--- Controllers ---
  final _currentPassController = TextEditingController();
  final _newPassController = TextEditingController();
  final _confirmPassController = TextEditingController();

  @override
  void dispose() {
    _currentPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //--- App Logo ---
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Sp",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: "o",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: "tReport",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
      //--- Change Password Main ---
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 15.0,
            ),
            //-- Title --
            child: Text(
              "Change Password",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //-- Current Password --
                Text(
                  "Current Password",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextField(
                  controller: _currentPassController,
                  obscureText: true,
                ),

                //-- New Password --
                Text(
                  "New Password",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextField(
                  controller: _newPassController,
                  obscureText: true,
                ),

                //-- Confirm New Password --
                Text(
                  "Confirm New Password",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextField(
                  controller: _confirmPassController,
                  obscureText: true,
                ),

                SizedBox(
                  height: 40,
                ),

                //-- Save button --
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                    ),
                    child: Text("Save"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
