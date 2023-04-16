import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_app/service/api_requests.dart';

import '../../../models/card_model.dart';
import '../../../service/card_requests.dart';

part 'public_event.dart';
part 'public_state.dart';

class PublicBloc extends Bloc<PublicEvent, PublicState> {
   final CardService cardService;
  List<Card> _cards = [];
  List<Card> get cards => _cards;

  PublicBloc({required this.cardService}) : super(PublicInitial()) {
    on<PublicEvent>((event, emit) {
      if (event is PublicLoadedEvent) {
        emit(PublicLoadedState(
          cards: cards,
        ));
      } else if (event is PublicLoadingEvent) {
        _initPublicPage();
      }
    });
    add(PublicLoadingEvent());
  }

   Future<void> _initPublicPage() async {
    try {
      _cards = await Isolate.run(cardService.getNearUsersCards);
    } catch (e) {
      print(e);
      _cards = [];
    }
    if (_cards != null) {
      add(PublicLoadedEvent(cards: _cards));
    }
  }
}
