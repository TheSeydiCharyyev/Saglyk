import 'package:bloc/bloc.dart';

part 'photoview_event.dart';
part 'photoview_state.dart';

class PhotoViewBloc extends Bloc<PhotoViewEvent, PhotoViewState> {
  PhotoViewBloc() : super(const PhotoViewState()) {
    on<PhotoViewChanged>(_onPhotoViewChanged);

  }

  void _onPhotoViewChanged(
      PhotoViewChanged event,
      Emitter<PhotoViewState> emit,
      ) {
    emit(state.copyWith(url: event.url));
  }

}
