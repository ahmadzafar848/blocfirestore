import 'dart:io';

import 'package:bloc_authentication/model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

FirebaseAuth auth = FirebaseAuth.instance;
File? image;
final imagePicker = ImagePicker();

Future signInUser(String email, String password) async {
  UserCredential authentication =
      await auth.signInWithEmailAndPassword(email: email, password: password);
  return authentication;
}

Future<User> signUpUser(UserModel model) async {
  UserCredential authentication = await auth.createUserWithEmailAndPassword(
      email: model.email!, password: model.password!);
  User? user = authentication.user;
  model.uid = user!.uid;
  if (user != null) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection('users')
        .doc(model.uid)
        .set(model.toMap());
    return user;
  }
  return user;
}

Future<File?> pickImage() async {
  XFile? imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
  if (imagePicked != null) {
    image = File(imagePicked.path);
    return image;
  } else {
    Fluttertoast.showToast(msg: 'Something Went Wrong');
  }
  return image;
}
