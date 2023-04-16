part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeLoadingEvent extends HomeEvent {
  HomeLoadingEvent();
}

class HomeLoadedEvent extends HomeEvent {
  final List<Card> cards;
  HomeLoadedEvent({required this.cards});
}
