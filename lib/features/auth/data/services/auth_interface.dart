import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthInterface {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> signInWithGoogle();
  Future<void> signInWithGithub(BuildContext context);
  Future<void> signOut();
  Future<void> sendPasswordResetEmail(String email);
}
