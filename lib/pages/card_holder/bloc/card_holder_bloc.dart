import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_holder_event.dart';
part 'card_holder_state.dart';

class CardHolderBloc extends Bloc<CardHolderEvent, CardHolderState> {
  CardHolderBloc() : super(CardHolderInitial()) {
    on<CardHolderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
