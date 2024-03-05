import 'dart:convert';

import 'package:http/http.dart';

import '../../../domain/models/cards.dart';

class ControllerAPI {
  ControllerAPI(this._client);

  final Client _client;
  String urlBase = 'https://db.ygoprodeck.com/api/v7/cardinfo.php';
  String apiUrl = '';

  Future<List<DataCard>?> getCards([String? getArchetype]) async {
    //final res = await _client.get(Uri.parse("$apiUrl?archetype=Crystron"));
    if (getArchetype != null) {
      apiUrl = '$urlBase?archetype=$getArchetype';
    } else {
      apiUrl = urlBase;
    }
    final res = await _client.get(Uri.parse(apiUrl));
    if (res.statusCode == 200) {
      final jsonResponse = json.decode(res.body);
      final List<DataCard> cards = [];
      if (jsonResponse['data'] is List) {
        for (var item in jsonResponse['data']) {
          if (item is Map<String, dynamic>) {
            final dataCard = DataCard(
              id: item['id'] ?? 1,
              name: item['name'] ?? '',
              type: item['type'] ?? '',
              frameType: item['frameType'] ?? '',
              desc: item['desc'],
              atk: item['atk'] ?? 0,
              def: item['def'] ?? 0,
              race: item['race'] ?? '',
              attribute: item['attribute'] ?? '',
              archetype: item['archetype'] ?? '',
              linkval: item['linkval'] ?? 0,
              banlistInfo: item['banlist_info'] != null
                  ? BanlistInfo.fromJson(item['banlist_info'])
                  : null,
              linkmarkers: (item['linkmarkers'] as List<dynamic>?)
                      ?.map((e) => e.toString())
                      .toList() ??
                  [],
              ygoprodeckUrl: item['ygoprodeck_url'] ?? '',
              cardSets: (item['set_name'] as List<dynamic>?)
                      ?.map((e) => CardSet.fromJson(e))
                      .toList() ??
                  [],
              cardImages: (item['card_images'] as List<dynamic>?)
                      ?.map((e) => CardImage.fromJson(e))
                      .toList() ??
                  [],
              cardPrices: (item['card_prices'] as List<dynamic>?)
                      ?.map((e) => CardPrice.fromJson(e))
                      .toList() ??
                  [],
            );
            cards.add(dataCard);
          }
        }
      }

      return cards;
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
