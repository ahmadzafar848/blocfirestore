import 'package:bloc_authentication/bloc/pickimagebloc/pick_image_bloc.dart';
import 'package:bloc_authentication/bloc/signinbloc/sign_in_bloc.dart';
import 'package:bloc_authentication/bloc/signupbloc/sign_up_bloc.dart';
import 'package:bloc_authentication/screens/signinscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SignInBloc>(
            create: (context) => SignInBloc(),
          ),
          BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(),
          ),
          BlocProvider<PickImageBloc>(
            create: (context) => PickImageBloc(),
          ),
        ],
        child: MaterialApp(
          home: SignInScreen(),
        ));
  }
}
