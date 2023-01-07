class CryptoModel {
  String? status;
  Data? data;

  CryptoModel({this.status, this.data});

  CryptoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Stats? stats;
  List<Coins>? coins;

  Data({this.stats, this.coins});

  Data.fromJson(Map<String, dynamic> json) {
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    if (json['coins'] != null) {
      coins = <Coins>[];
      json['coins'].forEach((v) {
        coins!.add(new Coins.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stats != null) {
      data['stats'] = this.stats!.toJson();
    }
    if (this.coins != null) {
      data['coins'] = this.coins!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stats {
  int? total;
  int? totalCoins;
  int? totalMarkets;
  int? totalExchanges;
  String? totalMarketCap;
  String? total24hVolume;

  Stats(
      {this.total,
        this.totalCoins,
        this.totalMarkets,
        this.totalExchanges,
        this.totalMarketCap,
        this.total24hVolume});

  Stats.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalCoins = json['totalCoins'];
    totalMarkets = json['totalMarkets'];
    totalExchanges = json['totalExchanges'];
    totalMarketCap = json['totalMarketCap'];
    total24hVolume = json['total24hVolume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['totalCoins'] = this.totalCoins;
    data['totalMarkets'] = this.totalMarkets;
    data['totalExchanges'] = this.totalExchanges;
    data['totalMarketCap'] = this.totalMarketCap;
    data['total24hVolume'] = this.total24hVolume;
    return data;
  }
}

class Coins {
  String? uuid;
  String? symbol;
  String? name;
  String? color;
  String? iconUrl;
  String? marketCap;
  String? price;
  int? listedAt;
  int? tier;
  String? change;
  int? rank;
  List<String>? sparkline;
  bool? lowVolume;
  String? coinrankingUrl;
  String? s24hVolume;
  String? btcPrice;

  Coins(
      {this.uuid,
        this.symbol,
        this.name,
        this.color,
        this.iconUrl,
        this.marketCap,
        this.price,
        this.listedAt,
        this.tier,
        this.change,
        this.rank,
        this.sparkline,
        this.lowVolume,
        this.coinrankingUrl,
        this.s24hVolume,
        this.btcPrice});

  Coins.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    symbol = json['symbol'];
    name = json['name'];
    color = json['color'];
    iconUrl = json['iconUrl'];
    marketCap = json['marketCap'];
    price = json['price'];
    listedAt = json['listedAt'];
    tier = json['tier'];
    change = json['change'];
    rank = json['rank'];
    sparkline = json['sparkline'].cast<String>();
    lowVolume = json['lowVolume'];
    coinrankingUrl = json['coinrankingUrl'];
    s24hVolume = json['24hVolume'];
    btcPrice = json['btcPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['color'] = this.color;
    data['iconUrl'] = this.iconUrl;
    data['marketCap'] = this.marketCap;
    data['price'] = this.price;
    data['listedAt'] = this.listedAt;
    data['tier'] = this.tier;
    data['change'] = this.change;
    data['rank'] = this.rank;
    data['sparkline'] = this.sparkline;
    data['lowVolume'] = this.lowVolume;
    data['coinrankingUrl'] = this.coinrankingUrl;
    data['24hVolume'] = this.s24hVolume;
    data['btcPrice'] = this.btcPrice;
    return data;
  }
}
