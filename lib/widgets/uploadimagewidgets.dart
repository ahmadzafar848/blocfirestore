import 'dart:io';

import 'package:flutter/material.dart';

class PickedImageInitialUI extends StatelessWidget {
  const PickedImageInitialUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.85,
      height: height * 0.6,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 1.5),
      ),
      child: Center(
        child: Text('Pick Image First'),
      ),
    );
  }
}

class UploadImageLoadedUI extends StatelessWidget {
  File image;

  UploadImageLoadedUI({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.85,
      height: height * 0.6,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 1.5),
      ),
      child: Center(
        child: Image.file(image),
      ),
    );
  }
}
