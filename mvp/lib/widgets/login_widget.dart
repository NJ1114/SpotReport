import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginWidget();
  }
}

class _LoginWidget extends State<LoginWidget> {
  //--- Controllers ---
  final _loginEmailControl = TextEditingController();
  final _loginPassControl = TextEditingController();

  @override
  void dispose() {
    _loginEmailControl.dispose();
    _loginPassControl.dispose();
    super.dispose();
  }

  //--- Login Handling ---
  Future<void> handleLogin() async {}

  @override
  Widget build(BuildContext context) {
    //--- Login Design ---
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //-- Email Input --
        TextField(
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
        Center(
          child: RichText(
            text: TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF353B3C),
              ),
              children: [
                TextSpan(
                  text: "Register",
                  style: TextStyle(
                    color: Color(0xFF3B98C6),
                  ),
                  // recognizer: TapGestureRecognizer()..onTap() {Navigator.push(context, route)},
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
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
            ))
      ],
    );
  }
}
