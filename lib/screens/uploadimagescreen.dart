import 'package:bloc_authentication/bloc/pickimagebloc/pick_image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../widgets/uploadimagewidgets.dart';

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final pickImageBloc = Provider.of<PickImageBloc>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          SizedBox(
            height: height * 0.1,
            child: Text('Upload Image'),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          SizedBox(
            height: height * 0.6,
            width: width * 0.85,
            child: BlocBuilder<PickImageBloc, PickImageState>(
              builder: (context, state) {
                if (state is PickImageInitialState) {
                  return PickedImageInitialUI();
                } else if (state is PickedImageLoadedState) {
                  return UploadImageLoadedUI(image: (state.image));
                } else if (state is PickedImageErrorState) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('You did not Picked '),
                        );
                      },
                    );
                  });
                  return PickedImageInitialUI();
                } else {
                  return Text('Builder Error');
                }
              },
            ),
          ),
          GestureDetector(
              onTap: () {
                pickImageBloc.add(
                  PickedImageEvent(),
                );
              },
              child: Container(
                height: height * 0.07,
                child: Center(
                  child: Text('PicKImage'),
                ),
                color: Colors.blue,
              )),
          GestureDetector(
              onTap: () {},
              child: Container(
                height: height * 0.07,
                child: Center(
                  child: Text('UploadImage'),
                ),
                color: Colors.blue,
              )),
          SizedBox(
            height: height * 0.01,
          ),
        ],
      ),
    );
  }
}
