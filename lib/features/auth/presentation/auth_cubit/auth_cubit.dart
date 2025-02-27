import 'package:e_commerce_app/features/auth/data/services/auth_interface.dart';
import 'package:e_commerce_app/features/auth/data/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.context) : super(AuthInitial());

  final AuthInterface _authInterface = FirebaseAuthService();
  final BuildContext context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  Future<void> signInWithEmailAndPassword({bool keepLoggedIn = false}) async {
    try {
      emit(SignInWithEmailAndPasswordLoading());

      await _authInterface.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      // Set persistence based on keepLoggedIn preference
      if (keepLoggedIn) {
        await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
      } else {
        await FirebaseAuth.instance.setPersistence(Persistence.SESSION);
      }

      emit(SignInWithEmailAndPasswordSuccess());
    } catch (e) {
      emit(SignInWithEmailAndPasswordFailure(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(SignInWithGoogleLoading());
      await _authInterface.signInWithGoogle();
      emit(SignInWithGoogleSuccess());
    } catch (e) {
      emit(SignInWithGoogleFailure(e.toString()));
    }
  }

  Future<void> signInWithGithub() async {
    try {
      emit(SignInWithGithubLoading());
      await _authInterface.signInWithGithub(context);
      emit(SignInWithGithubSuccess());
    } catch (e) {
      emit(SignInWithGithubFailure(e.toString()));
    }
  }

  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoading());
      await _authInterface.createUserWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
