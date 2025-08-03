import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  //--- Handle Saving New Password ---
  Future<void> updatePassword() async {
    //-- Variables --
    final user = FirebaseAuth.instance.currentUser;
    final oldPass = _currentPassController.text;
    final newPass = _newPassController.text;
    final confirmPass = _confirmPassController.text;

    //-- Password Verification --
    if (newPass != confirmPass) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match."),
        ),
      );
      return;
    }

    //-- Check user exists --
    if (user == null || user.email == null) {
      print("User not found.");
      return;
    }

    try {
      //-- Reauthenticate user --
      final credential =
          EmailAuthProvider.credential(email: user.email!, password: oldPass);
      await user.reauthenticateWithCredential(credential);

      //-- Update password --
      await user.updatePassword(newPass);
      Navigator.pop(context);
    }
    //-- Error Checking --
    on FirebaseAuthException catch (e) {
      //- Weak Password -
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The password provided is too weak."),
          ),
        );
      }
      //- Wrong Password -
      else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The password is incorrect."),
          ),
        );
      }
      //- Other Errors -
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Something went wrong. Please try again."),
          ),
        );
      }
    }
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
                    onPressed: updatePassword,
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
