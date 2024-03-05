class DataCard {
  DataCard({
    required this.id,
    required this.name,
    required this.type,
    required this.frameType,
    required this.desc,
    required this.def,
    required this.atk,
    required this.race,
    required this.attribute,
    required this.archetype,
    required this.linkval,
    required this.linkmarkers,
    required this.ygoprodeckUrl,
    required this.cardSets,
    required this.cardImages,
    required this.cardPrices,
    this.banlistInfo,
  });
  int id;
  String name;
  String type;
  String frameType;
  String desc;
  int atk;
  int def;
  String race;
  String attribute;
  String archetype;
  int linkval;
  List<String> linkmarkers;
  String ygoprodeckUrl;
  List<CardSet> cardSets;
  List<CardImage> cardImages;
  List<CardPrice> cardPrices;
  BanlistInfo? banlistInfo;
}

class CardImage {
  CardImage({
    required this.id,
    required this.imageUrl,
    required this.imageUrlSmall,
    required this.imageUrlCropped,
  });
  factory CardImage.fromJson(Map<String, dynamic> json) {
    return CardImage(
      id: json['id'] ?? '',
      imageUrl: json['image_url'] ?? '',
      imageUrlSmall: json['image_url_small'] ?? '',
      imageUrlCropped: json['image_url_cropped'] ?? '',
    );
  }
  int id;
  String imageUrl;
  String imageUrlSmall;
  String imageUrlCropped;
}

class CardPrice {
  CardPrice({
    required this.cardmarketPrice,
    required this.tcgplayerPrice,
    required this.ebayPrice,
    required this.amazonPrice,
    required this.coolstuffincPrice,
  });
  factory CardPrice.fromJson(Map<String, dynamic> json) {
    return CardPrice(
      cardmarketPrice: json['cardmarket_price'] ?? '',
      tcgplayerPrice: json['tcgplayer_price'] ?? '',
      ebayPrice: json['ebay_price'] ?? '',
      amazonPrice: json['amazon_price'] ?? '',
      coolstuffincPrice: json['coolstuffinc_price'] ?? '',
    );
  }
  String cardmarketPrice;
  String tcgplayerPrice;
  String ebayPrice;
  String amazonPrice;
  String coolstuffincPrice;
}

class CardSet {
  CardSet({
    required this.setName,
    required this.setCode,
    required this.setRarity,
    required this.setRarityCode,
    required this.setPrice,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) {
    return CardSet(
      setName: json['set_name'] ?? '',
      setCode: json['set_code'] ?? '',
      setRarity: json['set_rarity'] ?? '',
      setRarityCode: json['set_rarity_code'] ?? '',
      setPrice: json['set_price'] ?? '',
    );
  }
  String setName;
  String setCode;
  String setRarity;
  String setRarityCode;
  String setPrice;
}

class BanlistInfo {
  BanlistInfo(
      {required this.banTcg, required this.banOcg, required this.banGoat});

  factory BanlistInfo.fromJson(Map<String, dynamic> json) {
    return BanlistInfo(
      banTcg: json['ban_tcg'] ?? '',
      banOcg: json['ban_ocg'] ?? '',
      banGoat: json['ban_goat'] ?? '',
    );
  }
  String banTcg;
  String banOcg;
  String banGoat;
}
