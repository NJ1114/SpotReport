import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginRegisterWidget extends StatefulWidget {
  const LoginRegisterWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginWidget();
  }
}

class _LoginWidget extends State<LoginRegisterWidget> {
  bool isLoginView = true;

  //--- Controllers ---
  final _loginEmailControl = TextEditingController();
  final _loginPassControl = TextEditingController();

  final _registerEmailControl = TextEditingController();
  final _registerPassControl = TextEditingController();
  final _registerConfirmPassControl = TextEditingController();

  @override
  void dispose() {
    _loginEmailControl.dispose();
    _loginPassControl.dispose();
    _registerEmailControl.dispose();
    _registerPassControl.dispose();
    _registerConfirmPassControl.dispose();
    super.dispose();
  }

  //--- Login Handling ---
  Future<void> handleLogin() async {
    final email = _loginEmailControl.text;
    final password = _loginPassControl.text;

    print('Login attempt with: $email');
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //--- Register Handling ---
  Future<void> handleRegister() async {
    final email = _registerEmailControl.text;
    final password = _registerPassControl.text;
    final confirmPass = _registerConfirmPassControl.text;

    //-- Password Comparison --
    if (password != confirmPass) {
      print('Passwords do not match');
      return;
    }

    print('Registration attempt with: $email');
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    //--- Login Design ---
    return Column(
      children: [
        //-- Display login or register "screen" -> Default Login
        isLoginView ? _buildLogin() : _buildRegister(),
        //-- Link to login or register version --
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isLoginView
                ? "Don't have an account? "
                : "Already have an account? "),
            //-- Pressable link --
            GestureDetector(
              onTap: () {
                setState(() {
                  isLoginView = !isLoginView;
                });
              },
              child: Text(
                isLoginView ? "Register" : "Login",
                style: TextStyle(
                  color: Color(0xFF3B98C6),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //--- Building Login ---
  Widget _buildLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //-- Current Status Title --
        Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),

        //-- Email Input --
        TextField(
          controller: _loginEmailControl,
          decoration: InputDecoration(
            label: Text("Enter your email"),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF3B98C6),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),

        //-- Password Input --
        TextField(
          controller: _loginPassControl,
          decoration: InputDecoration(
            label: Text("Enter your password"),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF3B98C6),
              ),
            ),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 65,
        ),

        //-- Login button --
        ElevatedButton(
          onPressed: handleLogin,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3B98C6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  //--- Building Register ---
  Widget _buildRegister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //-- Current Status Title --
        Center(
          child: Text(
            "Register",
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),

        //-- Email Input --
        TextField(
          controller: _registerEmailControl,
          decoration: InputDecoration(
            label: Text("Enter your email"),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF3B98C6),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),

        //-- Password Input --
        TextField(
          controller: _registerPassControl,
          decoration: InputDecoration(
            label: Text("Choose a password"),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF3B98C6),
              ),
            ),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 30,
        ),

        //-- Confirm Password --
        TextField(
          controller: _registerConfirmPassControl,
          decoration: InputDecoration(
            label: Text("Confirm password"),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF3B98C6),
              ),
            ),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 65,
        ),

        //-- Register button --
        ElevatedButton(
          onPressed: handleRegister,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3B98C6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Register',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
