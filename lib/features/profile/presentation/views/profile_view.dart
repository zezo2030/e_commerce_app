import 'package:flutter/material.dart';
import '../widgets/profile_widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              ProfileHeader(),
              SizedBox(height: 20),
              ProfileMenu(),
            ],
          ),
        ),
      ),
    );
  }
}
