import 'package:e_commerce_app/core/services/auth_service.dart';
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

  bool? keepLoggedIn = false;

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInWithEmailAndPasswordLoading());

      await _authInterface.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      // حفظ حالة "احتفظ بتسجيل دخولي"
      await AuthService.saveKeepLoggedIn(keepLoggedIn!);

      emit(SignInWithEmailAndPasswordSuccess());
    } catch (e) {
      emit(SignInWithEmailAndPasswordFailure(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(SignInWithGoogleLoading());
      await _authInterface.signInWithGoogle();

      // حفظ حالة "احتفظ بتسجيل دخولي"
      await AuthService.saveKeepLoggedIn(keepLoggedIn!);

      emit(SignInWithGoogleSuccess());
    } catch (e) {
      emit(SignInWithGoogleFailure(e.toString()));
      print('Error signing in with Google: $e');
    }
  }

  Future<void> signInWithGithub() async {
    try {
      emit(SignInWithGithubLoading());
      await _authInterface.signInWithGithub(context);

      // حفظ حالة "احتفظ بتسجيل دخولي"
      await AuthService.saveKeepLoggedIn(keepLoggedIn!);

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
      // حفظ حالة "احتفظ بتسجيل دخولي"
      await AuthService.saveKeepLoggedIn(keepLoggedIn!);

      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await AuthService.signOut();
    } catch (e) {
      // Handle sign out errors
      print('Error signing out: $e');
    }
  }

  void checkKeepLoggedIn(bool? value) {
    keepLoggedIn = value ?? false;
    emit(CheckKeepLoggedIn());
  }

  Future<void> sendPasswordResetEmail() async {
    try {
      emit(SendPasswordResetEmailLoading());
      await _authInterface.sendPasswordResetEmail(emailController.text);
      emit(SendPasswordResetEmailSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SendPasswordResetEmailFailure(e.toString()));
    }
  }
}
