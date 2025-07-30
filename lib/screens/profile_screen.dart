import 'package:flutter/material.dart';
import 'package:spotreport/widgets/login_register_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoutWidget(),
      ],
    );
  }
}
