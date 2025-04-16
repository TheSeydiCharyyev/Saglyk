part of 'photoview_bloc.dart';

class PhotoViewState {
  const PhotoViewState({
    this.url="",
  });

  final String url;

  PhotoViewState copyWith({
    String? url,
  }) {
    return PhotoViewState(
      url: url ?? this.url,
    );
  }

}
