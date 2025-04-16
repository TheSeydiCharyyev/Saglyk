part of 'photoview_bloc.dart';

abstract class PhotoViewEvent {
  const PhotoViewEvent();

}

class PhotoViewChanged extends PhotoViewEvent {
  const PhotoViewChanged(this.url);

  final String url;

}

