import 'package:bloc_authentication/screens/signinscreen.dart';
import 'package:bloc_authentication/screens/uploadimagescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return SignInScreen();
                  },
                ));
              },
              icon: Icon(Icons.signpost_outlined))
        ],
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
            child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return UploadImageScreen();
              },
            ));
          },
          child: Text('UploadImage'),
        )),
      ),
    );
  }
}
