import 'package:evira_admin_panel/feature/main_app/presentation/widgets/default_app_bar.dart';
import 'package:evira_admin_panel/feature/main_app/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("Admin Home"),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
