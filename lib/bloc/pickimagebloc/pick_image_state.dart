part of 'pick_image_bloc.dart';

@immutable
abstract class PickImageState {}

class PickImageInitialState extends PickImageState {}

class PickedImageLoadingState extends PickImageState {}

class PickedImageLoadedState extends PickImageState {
  final File image;
  PickedImageLoadedState({required this.image});
}

class PickedImageErrorState extends PickImageState {
  final String msg;
  PickedImageErrorState({required this.msg});
}
