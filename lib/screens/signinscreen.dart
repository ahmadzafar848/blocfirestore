import 'package:bloc_authentication/bloc/signinbloc/sign_in_bloc.dart';
import 'package:bloc_authentication/screens/homescreen.dart';
import 'package:bloc_authentication/widgets/signinwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('suffiii');
    return Scaffold(
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInInitial) {
            return SignInInitialUI();
          } else if (state is SignInLoadedState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ));
            });
            return SizedBox();
          } else if (state is SignInErrorState) {
            return SignInErrorUI(msg: state.msg);
          } else {
            return Center(
              child: Text('Builder Error'),
            );
          }
        },
      ),
    );
  }
}
