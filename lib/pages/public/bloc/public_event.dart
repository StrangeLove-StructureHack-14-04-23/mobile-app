part of 'public_bloc.dart';

@immutable
abstract class PublicEvent {}

class PublicLoadingEvent extends PublicEvent {
  PublicLoadingEvent();
}

class PublicLoadedEvent extends PublicEvent {
  final List<Card> cards;
  PublicLoadedEvent({required this.cards});
}

