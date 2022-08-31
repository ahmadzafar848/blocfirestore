part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpAuthenticatedEvent extends SignUpEvent {
  UserModel userModel;
  SignUpAuthenticatedEvent({required this.userModel});
}
