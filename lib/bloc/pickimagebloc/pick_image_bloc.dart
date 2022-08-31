import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_authentication/firebase_webapis/firebase_auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'pick_image_event.dart';
part 'pick_image_state.dart';

class PickImageBloc extends Bloc<PickImageEvent, PickImageState> {
  PickImageBloc() : super(PickImageInitialState()) {
    on<PickedImageEvent>((event, emit) async {
      try {
        File? image = await pickImage();
        emit.call(PickedImageLoadedState(image: image!));
      } catch (e) {
        emit.call(PickedImageErrorState(msg: e.toString()));
      }
    });
  }
}
