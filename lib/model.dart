class CoinDetails {
  CoinDetails({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage24H,
  });

  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;
  final double? priceChangePercentage24H;

  factory CoinDetails.fromJson(Map<String, dynamic> json) {
    return CoinDetails(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"],
      image: json["image"],
      currentPrice: json["current_price"].toDouble(),
      priceChangePercentage24H: json["price_change_percentage_24h"],
    );
  }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "symbol": symbol,
//         "name": name,
//         "image": image,
//         "current_price": currentPrice,
//         "price_change_percentage_24h": priceChangePercentage24H,
//       };
}
