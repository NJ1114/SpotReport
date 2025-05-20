import 'package:flutter/gestures.dart';
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
  Future<void> handleLogin() async {}

  //--- Register Handling ---
  Future<void> handleRegister() async {}

  @override
  Widget build(BuildContext context) {
    //--- Login Design ---
    return Column(
      children: [
        isLoginView ? _buildLogin() : _buildRegister(),
        //-- Link to login or register version --

        Text(isLoginView
            ? "Don't have an account? "
            : "Already have an account? "),
        Row(
          children: [
            // recognizer: TapGestureRecognizer()
            //   ..onTap = () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (BuildContext context) =>
            //             UserRegisterScreen(),
            //       ),
            //     );
            //   },
          ],
        )
      ],
    );
  }

  //--- Building Login ---
  Widget _buildLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
          height: 70,
        ),
        
        //-- Login button --
        ElevatedButton(
          onPressed: () {},
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
        //-- Email Input --
        TextField(
          controller: _registerEmailControl,
          decoration: InputDecoration(
            label: Text("Email"),
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
          height: 70,
        ),

        //-- Register button --
        ElevatedButton(
          onPressed: () {},
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
