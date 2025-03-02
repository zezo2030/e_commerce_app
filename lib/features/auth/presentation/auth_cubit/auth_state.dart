part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

//! Auth Initial
final class AuthInitial extends AuthState {}

//! Sign In With Email And Password
final class SignInWithEmailAndPasswordLoading extends AuthState {}

final class SignInWithEmailAndPasswordSuccess extends AuthState {}

final class SignInWithEmailAndPasswordFailure extends AuthState {
  final String error;
  SignInWithEmailAndPasswordFailure(this.error);
}

//! Sign In With Google
final class SignInWithGoogleLoading extends AuthState {}

final class SignInWithGoogleSuccess extends AuthState {}

final class SignInWithGoogleFailure extends AuthState {
  final String error;
  SignInWithGoogleFailure(this.error);
}

//! Sign In With Github
final class SignInWithGithubLoading extends AuthState {}

final class SignInWithGithubSuccess extends AuthState {}

final class SignInWithGithubFailure extends AuthState {
  final String error;
  SignInWithGithubFailure(this.error);
}

//! Sign Up
final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String error;
  SignUpFailure(this.error);
}

//! Check Keep Logged In
final class CheckKeepLoggedIn extends AuthState {}

//! Send Password Reset Email
final class SendPasswordResetEmailLoading extends AuthState {}

final class SendPasswordResetEmailSuccess extends AuthState {}

final class SendPasswordResetEmailFailure extends AuthState {
  final String error;
  SendPasswordResetEmailFailure(this.error);
}
