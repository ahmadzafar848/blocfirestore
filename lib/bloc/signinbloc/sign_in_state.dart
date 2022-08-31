part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInLoadedState extends SignInState {
  final user;
  SignInLoadedState({required this.user});
}

class SignInErrorState extends SignInState {
  final msg;
  SignInErrorState({required this.msg});
}
