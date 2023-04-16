part of 'public_bloc.dart';

@immutable
abstract class PublicState {}

class PublicInitial extends PublicState {}

class PublicLoadingState extends PublicInitial {}

class PublicLoadedState extends PublicInitial {
  final List<Card> cards;

  PublicLoadedState({required this.cards});
}