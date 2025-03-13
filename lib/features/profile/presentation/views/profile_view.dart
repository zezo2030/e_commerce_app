import 'package:e_commerce_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/profile_widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              const SizedBox(height: 20),
              BlocProvider(
                create: (context) => AuthCubit(context),
                child: const ProfileMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
