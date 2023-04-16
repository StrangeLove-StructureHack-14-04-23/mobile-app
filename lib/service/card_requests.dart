import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';

import '../models/card_model.dart';
import '../pages/editor/data_editor_page.dart';
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

  void createCard({
    required String role,
    required String phone,
    required String own_site,
    required String linkedin_url,
    required String telegram_url,
  }) async {
    final response = await APIService.postRequest(
      request: 'api/cards/create',
      data: {
        'role': role,
        'phone': phone,
        'own_site': own_site,
        'linkedin_url': linkedin_url,
        'telegram_url': telegram_url,
        'owner_id': prefs.getString('id')!,
      },
    );
    if (response != null) {
      print('success');
      DataRedactorPage.isCardSend = true;

    } else {
      DataRedactorPage.isCardSend = false;
    }
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
