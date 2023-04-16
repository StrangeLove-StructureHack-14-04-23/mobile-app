import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/card_model.dart';
import '../../../service/card_requests.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CardService cardService;
  List<Card> _cards = [];
  List<Card> get cards => _cards;

  HomeBloc({required this.cardService}) : super(HomeLoadingState()) {
    on<HomeEvent>((event, emit) {
      if (event is HomeLoadedEvent) {
        emit(HomeLoadedState(
          cards: cards,
        ));
      } else if (event is HomeLoadingEvent) {
        _initHome();
      }
    });
    add(HomeLoadingEvent());
  }

  Future<void> _initHome() async {
    try {
      _cards = await Isolate.run(cardService.getAllUserCards);
    } catch (e) {
      print(e);
      _cards = [];
    }
    if (_cards != null) {
      add(HomeLoadedEvent(cards: _cards));
    }
  }
}
