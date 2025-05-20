import 'package:flutter/material.dart';
import 'package:mvp/widgets/login_register_widget.dart';

class UserLogRegScreen extends StatelessWidget {
  const UserLogRegScreen({super.key});

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
              LoginRegisterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
