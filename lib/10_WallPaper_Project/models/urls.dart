class Urls {
  Urls({
    required this.regular,
    required this.small,
  });

  String regular;
  String small;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        regular: json["regular"],
        small: json["small"],
      );

  Map<String, dynamic> toJson() => {
        "regular": regular,
        "small": small,
      };
}
