import 'package:bloc_authentication/model/usermodel.dart';
import 'package:bloc_authentication/screens/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/signupbloc/sign_up_bloc.dart';

class SignUpInitialUI extends StatelessWidget {
  SignUpInitialUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Faisal();
  }
}

class Faisal extends StatelessWidget {
  Faisal({Key? key}) : super(key: key);
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  final TextEditingController secondNameTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  static final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    final signUpBloc = Provider.of<SignUpBloc>(context, listen: false);
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
              height: height * 0.05,
            ),
            SizedBox(
              height: height * 0.1,
              child: Text(
                'SignUp Screen',
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
                          ? 'Enter Your Name Here'
                          : (nameRegExp.hasMatch(value)
                              ? null
                              : 'Enter a Valid Name'),
                      controller: firstNameTextEditingController,
                      decoration: InputDecoration(
                        hintText: 'First Name',
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
                      validator: (value) => value!.isEmpty
                          ? 'Enter Your Name Here'
                          : (nameRegExp.hasMatch(value)
                              ? null
                              : 'Enter a Valid Name'),
                      controller: secondNameTextEditingController,
                      decoration: InputDecoration(
                        hintText: 'Second Name',
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
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.1,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is Empty';
                        }
                        if (confirmPasswordTextEditingController.text !=
                            passwordTextEditingController.text) {
                          return 'Password Does Not Match';
                        }
                        return null;
                      },
                      controller: confirmPasswordTextEditingController,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
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
              height: height * 0.05,
            ),
            GestureDetector(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    var model = UserModel(
                        firstName: firstNameTextEditingController.text,
                        secondName: secondNameTextEditingController.text,
                        email: emailTextEditingController.text,
                        password: passwordTextEditingController.text);
                    signUpBloc.add(SignUpAuthenticatedEvent(userModel: model));
                  }
                },
                child: Container(
                  height: height * 0.1,
                  width: width * 0.8,
                  child: Center(
                    child: Text('SignUp'),
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
                        return SignInScreen();
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
              height: height * 0.05,
            )
          ],
        ),
      ),
    );
  }
}

class SignUpErrorUI extends StatelessWidget {
  const SignUpErrorUI({Key? key, required this.msg}) : super(key: key);
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

/////////////////////////////////////////////////////////////////////////////////////////
// class XNXX extends StatelessWidget {
//
//   final TextEditingController emailTextEditingController =
//   TextEditingController();
//   final TextEditingController firstNameTextEditingController =
//   TextEditingController();
//   final TextEditingController secondNameTextEditingController =
//   TextEditingController();
//   final TextEditingController passwordTextEditingController =
//   TextEditingController();
//   final TextEditingController confirmPasswordTextEditingController =
//   TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   final RegExp nameRegExp = RegExp('[a-zA-Z]');
//   final emailValid = RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//   XNXX({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final signUpBloc = Provider.of<SignUpBloc>(context, listen: false);
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Center(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: height * 0.05,
//             ),
//             SizedBox(
//               height: height * 0.1,
//               child: Text(
//                 'SignUp Screen',
//                 style: TextStyle(color: Colors.black, fontSize: 18),
//               ),
//             ),
//             Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     width: width * 0.8,
//                     height: height * 0.1,
//                     child: TextFormField(
//                       validator: (value) => value!.isEmpty
//                           ? 'Enter Your Name Here'
//                           : (nameRegExp.hasMatch(value)
//                           ? null
//                           : 'Enter a Valid Name'),
//                       controller: firstNameTextEditingController,
//                       decoration: InputDecoration(
//                         hintText: 'First Name',
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: width * 0.8,
//                     height: height * 0.1,
//                     child: TextFormField(
//                       validator: (value) => value!.isEmpty
//                           ? 'Enter Your Name Here'
//                           : (nameRegExp.hasMatch(value)
//                           ? null
//                           : 'Enter a Valid Name'),
//                       controller: secondNameTextEditingController,
//                       decoration: InputDecoration(
//                         hintText: 'Second Name',
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: width * 0.8,
//                     height: height * 0.1,
//                     child: TextFormField(
//                       validator: (value) => value!.isEmpty
//                           ? 'Enter Your Email Here'
//                           : (emailValid.hasMatch(value)
//                           ? null
//                           : 'Enter a Valid Email'),
//                       controller: emailTextEditingController,
//                       decoration: InputDecoration(
//                         hintText: 'Email',
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: width * 0.8,
//                     height: height * 0.1,
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Password is Empty';
//                         }
//                         if (value.length < 6) {
//                           return 'Provide Password of length 6 or more';
//                         }
//                         return null;
//                       },
//                       controller: passwordTextEditingController,
//                       decoration: InputDecoration(
//                         hintText: 'Password',
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: width * 0.8,
//                     height: height * 0.1,
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Password is Empty';
//                         }
//                         if (confirmPasswordTextEditingController.text !=
//                             passwordTextEditingController.text) {
//                           return 'Password Does Not Match';
//                         }
//                         return null;
//                       },
//                       controller: confirmPasswordTextEditingController,
//                       decoration: InputDecoration(
//                         hintText: 'Confirm Password',
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: height * 0.05,
//             ),
//             GestureDetector(
//                 onTap: () async {
//                   if (formKey.currentState!.validate()) {
//                     var model = UserModel(
//                         firstName: firstNameTextEditingController.text,
//                         secondName: secondNameTextEditingController.text,
//                         email: emailTextEditingController.text,
//                         password: passwordTextEditingController.text);
//                     signUpBloc.add(SignUpAuthenticatedEvent(userModel: model));
//                   }
//                 },
//                 child: Container(
//                   height: height * 0.1,
//                   width: width * 0.8,
//                   child: Center(
//                     child: Text('SignUp'),
//                   ),
//                   color: Colors.blue,
//                 )),
//             SizedBox(
//               height: height * 0.05,
//             ),
//             SizedBox(
//               height: height * 0.1,
//               child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return SignInScreen();
//                       },
//                     ));
//                   },
//                   child: Align(
//                       alignment: Alignment.centerRight,
//                       child: Padding(
//                         padding: EdgeInsets.only(right: width * 0.05),
//                         child: Text('Already have an Account,SignIn Here'),
//                       ))),
//             ),
//             SizedBox(
//               height: height * 0.05,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

Widget signUpWidgetUI(BuildContext context) {
  final signUpBloc = Provider.of<SignUpBloc>(context, listen: false);
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  final TextEditingController secondNameTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RegExp nameRegExp = RegExp('[a-zA-Z]');
  final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          SizedBox(
            height: height * 0.1,
            child: Text(
              'SignUp Screen',
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
                        ? 'Enter Your Name Here'
                        : (nameRegExp.hasMatch(value)
                            ? null
                            : 'Enter a Valid Name'),
                    controller: firstNameTextEditingController,
                    decoration: InputDecoration(
                      hintText: 'First Name',
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
                    validator: (value) => value!.isEmpty
                        ? 'Enter Your Name Here'
                        : (nameRegExp.hasMatch(value)
                            ? null
                            : 'Enter a Valid Name'),
                    controller: secondNameTextEditingController,
                    decoration: InputDecoration(
                      hintText: 'Second Name',
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
                SizedBox(
                  width: width * 0.8,
                  height: height * 0.1,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is Empty';
                      }
                      if (confirmPasswordTextEditingController.text !=
                          passwordTextEditingController.text) {
                        return 'Password Does Not Match';
                      }
                      return null;
                    },
                    controller: confirmPasswordTextEditingController,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
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
            height: height * 0.05,
          ),
          GestureDetector(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  var model = UserModel(
                      firstName: firstNameTextEditingController.text,
                      secondName: secondNameTextEditingController.text,
                      email: emailTextEditingController.text,
                      password: passwordTextEditingController.text);
                  signUpBloc.add(SignUpAuthenticatedEvent(userModel: model));
                }
              },
              child: Container(
                height: height * 0.1,
                width: width * 0.8,
                child: Center(
                  child: Text('SignUp'),
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
                      return SignInScreen();
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
            height: height * 0.05,
          )
        ],
      ),
    ),
  );
}
