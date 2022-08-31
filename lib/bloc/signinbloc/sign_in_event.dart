part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInAuthenticatedBlocEvent extends SignInEvent {
  String email;
  String password;
  SignInAuthenticatedBlocEvent({required this.email, required this.password});
}
