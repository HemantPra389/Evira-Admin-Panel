import 'package:evira_admin_panel/feature/main_app/presentation/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar("Profile"),
      body: Center(
        child: Text("Profile Screen"),
      ),
    );
  }
}