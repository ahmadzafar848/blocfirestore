import 'package:bloc/bloc.dart';
import 'package:bloc_authentication/firebase_webapis/firebase_auth_methods.dart';
import 'package:bloc_authentication/model/usermodel.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpAuthenticatedEvent>((event, emit) async {
      print('^^^^^^^^^^^^^^^^^');
      try {
        var model = event.userModel;
        final user = await signUpUser(model);

        emit.call(
          SignUpLoadedState(user: user),
        );
      } catch (e) {
        emit.call(
          SignUpErrorState(
            msg: e.toString(),
          ),
        );
      }
    });
  }
}
