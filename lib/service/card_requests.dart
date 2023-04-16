import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';

import '../models/card_model.dart';
import 'api_service.dart';

class CardService {
  final SharedPreferences prefs;

  CardService({required this.prefs});

  Future<List<Card>> getAllUserCards() async {
    String id = prefs.getString('id') ?? '';

    final response = await APIService.getRequest(
      request: 'api/cards/user',
      data: {'id': id},
    );
    print(response.toString());

    if (response != null) {
      final List<Card> cards = [];
      for (final card in response) {
        cards.add(Card.fromJson(card));
      }
      return cards;
    }
    return [];
  }

  void createCard(String id) async {
    final response = await APIService.postRequest(
      request: 'api/cards/create',
      data: {'id': id},
    );
    if (response != null) {
      print('success');
    } else {}
  }

  Future<List<Card>> getNearUsersCards() async {
    WifiInfoWrapper? _wifiObject;
    WifiInfoWrapper? wifiObject;
    var response = null;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      wifiObject = await WifiInfoPlugin.wifiDetails;
      String ipAddress =
          _wifiObject != null ? _wifiObject.ipAddress.toString() : "";
      final response = await APIService.getRequest(
        request: 'api/cards/user',
        data: {'ip': ipAddress},
      );
      print(response.toString());
    } catch (e) {}
    if (response != null) {
      final List<Card> cards = [];
      for (final card in response) {
        cards.add(Card.fromJson(card));
      }
      return cards;
    }
    return [];
  }
}
