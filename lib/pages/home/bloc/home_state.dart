part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeInitial {}

class HomeLoadedState extends HomeInitial {
  final List<Card> cards;

  HomeLoadedState({required this.cards});
}
