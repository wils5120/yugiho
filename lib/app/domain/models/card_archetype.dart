
class Datum {

    Datum({
        required this.id,
        required this.name,
        required this.type,
        required this.frameType,
        required this.desc,
        required this.race,
        required this.archetype,
        required this.ygoprodeckUrl,
        this.cardSets,
        required this.cardImages,
        required this.cardPrices,
        this.atk,
        this.def,
        this.level,
        this.attribute,
        this.linkval,
        this.linkmarkers,
        this.banlistInfo,
    });
    int id;
    String name;
    String type;
    String frameType;
    String desc;
    Race race;
    Archetype archetype;
    String ygoprodeckUrl;
    List<CardSet>? cardSets;
    List<CardImage> cardImages;
    List<CardPrice> cardPrices;
    int? atk;
    int? def;
    int? level;
    Attribute? attribute;
    int? linkval;
    List<String>? linkmarkers;
    BanlistInfo? banlistInfo;

}

enum Archetype {
    crystron
}

enum Attribute {
    water
}

class BanlistInfo {

    BanlistInfo({
        required this.banTcg,
        required this.banOcg,
    });
    String banTcg;
    String banOcg;

}

class CardImage {

    CardImage({
        required this.id,
        required this.imageUrl,
        required this.imageUrlSmall,
        required this.imageUrlCropped,
    });
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
    String setName;
    String setCode;
    SetRarity setRarity;
    SetRarityCode setRarityCode;
    String setPrice;

}

enum SetRarity {
    common,
    // ignore: constant_identifier_names
    scret_rate,
    // ignore: constant_identifier_names
    super_rare,
    // ignore: constant_identifier_names
    ultimate_rare,
    // ignore: constant_identifier_names
    ultra_rare
}

enum SetRarityCode {
    c,
    // ignore: constant_identifier_names
    sc_r,
    sr,
    ur,
    // ignore: constant_identifier_names
    ut_r

}

enum Race {
    field,
    machine,
    normal

}
