import 'urls.dart';

class Wallpaper {
  Wallpaper({
    required this.description,
    required this.altDescription,
    required this.urls,
  });

  String description;
  String altDescription;
  Urls urls;

  factory Wallpaper.fromJson(Map<String, dynamic> json) => Wallpaper(
        description: json["description"] ?? "",
        altDescription: json["alt_description"] ?? "",
        urls: Urls.fromJson(json["urls"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toJson(),
      };
}
