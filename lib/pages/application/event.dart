part of 'bloc.dart';

abstract class ApplicationEvent {
  const ApplicationEvent();
}

class PageChanged extends ApplicationEvent {
  const PageChanged(this.page);
  final int page;
}