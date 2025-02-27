import 'package:e_commerce_app/features/auth/data/services/auth_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_oauth/github_oauth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService implements AuthInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email, password: password,
      
      );
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signInWithGithub(BuildContext context) async {
    //* https://e-commerce-app-44b37.firebaseapp.com/__/auth/handler

    // Create a GitHubSignIn instance
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
      clientId: "Iv23lispQO6ge7BRSKLF",
      clientSecret: "976272d962560a92610b2c874491c1146d6147ea",
      redirectUrl:
          'https://e-commerce-app-44b37.firebaseapp.com/__/auth/handler',
    );

    // Trigger the sign-in flow
    final result = await gitHubSignIn.signIn(context);

    // Create a credential from the access token
    final githubAuthCredential = GithubAuthProvider.credential(result.token!);
    // Once signed in, perform the sign-in with credential
    await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);
  }

  @override
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
