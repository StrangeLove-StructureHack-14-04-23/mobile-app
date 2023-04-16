// To parse this JSON data, do
//
//     final card = cardFromJson(jsonString);

import 'dart:convert';

List<Card> cardFromJson(String str) => List<Card>.from(json.decode(str).map((x) => Card.fromJson(x)));

String cardToJson(List<Card> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Card {
    Card({
        required this.id,
        required this.role,
        required this.phone,
        required this.ownSite,
        required this.linkedinUrl,
        required this.telegramUrl,
    });

    int id;
    String role;
    String phone;
    String ownSite;
    String linkedinUrl;
    String telegramUrl;

    factory Card.fromJson(Map<String, dynamic> json) => Card(
        id: json["id"],
        role: json["role"],
        phone: json["phone"],
        ownSite: json["own_site"],
        linkedinUrl: json["linkedin_url"],
        telegramUrl: json["telegram_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "phone": phone,
        "own_site": ownSite,
        "linkedin_url": linkedinUrl,
        "telegram_url": telegramUrl,
    };
}
