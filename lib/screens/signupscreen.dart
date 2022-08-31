import 'package:bloc_authentication/bloc/signupbloc/sign_up_bloc.dart';
import 'package:bloc_authentication/widgets/signupwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final abc = context.read<SignUpBloc>();
    print(abc);
    return Scaffold(body: BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        print(state);
        if (state is SignUpInitial) {
          print('@@@@@@@@@@@@@@@');
          return SignUpInitialUI();
        } else if (state is SignUpLoadedState) {
          print('*******************************');
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return SignInScreen();
            //   },
            // ));
            Navigator.pop(context);
          });

          return SizedBox();
        } else if (state is SignUpErrorState) {
          return SignUpErrorUI(msg: state.msg);
        } else {
          return Center(
            child: Text('Builder Error'),
          );
        }
      },
    ));
  }
}
