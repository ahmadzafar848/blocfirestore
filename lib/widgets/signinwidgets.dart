import 'package:bloc_authentication/bloc/signinbloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/signupscreen.dart';

class SignInInitialUI extends StatelessWidget {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  static final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  SignInInitialUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signInBloc = Provider.of<SignInBloc>(context, listen: false);
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double height =
        MediaQuery.of(context).size.height - kToolbarHeight - statusBarHeight;
    double width = MediaQuery.of(context).size.width;
    MediaQuery.of(context).size.width;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            SizedBox(
              height: height * 0.1,
              child: Text(
                'SignIn Screen',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.1,
                    child: TextFormField(
                      validator: (value) => value!.isEmpty
                          ? 'Enter Your Email Here'
                          : (emailValid.hasMatch(value)
                              ? null
                              : 'Enter a Valid Email'),
                      controller: emailTextEditingController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.1,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is Empty';
                        }
                        if (value.length < 6) {
                          return 'Provide Password of length 6 or more';
                        }
                        return null;
                      },
                      controller: passwordTextEditingController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    signInBloc.add(SignInAuthenticatedBlocEvent(
                        email: emailTextEditingController.text,
                        password: passwordTextEditingController.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Validation Successfull'),
                      ),
                    );
                  }
                },
                child: Container(
                  height: height * 0.1,
                  width: width * 0.8,
                  child: Center(
                    child: Text('SignIn'),
                  ),
                  color: Colors.blue,
                )),
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              height: height * 0.1,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ));
                  },
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: width * 0.05),
                        child: Text('Already have an Account,SignIn Here'),
                      ))),
            ),
            SizedBox(
              height: height * 2.5,
            )
          ],
        ),
      ),
    );
  }
}

class SignInErrorUI extends StatelessWidget {
  const SignInErrorUI({Key? key, required this.msg}) : super(key: key);
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(msg),
      ),
    );
  }
}
