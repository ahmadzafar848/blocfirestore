import 'package:bloc/bloc.dart';
import 'package:bloc_authentication/firebase_webapis/firebase_auth_methods.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInAuthenticatedBlocEvent>((event, emit) async {
      try {
        final user = await signInUser(event.email, event.password);
        emit.call(SignInLoadedState(user: user));
      } catch (e) {
        emit.call(SignInErrorState(msg: 'Can Not Sign In'));
      }
    });
  }
}
