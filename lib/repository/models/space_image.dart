import 'package:intl/intl.dart';

T _getOrDefault<T>(
  Map<String, dynamic> json, {
  required String key,
  required T defaultValue,
}) {
  final value = json[key];
  if (value is T) {
    return value;
  } else {
    return defaultValue;
  }
}

class SpaceImage {
  SpaceImage({
    required this.id,
    required this.title,
    required this.url,
    required this.explanation,
    required this.date,
    required this.mediaType,
  });

  factory SpaceImage.fromJson(Map<String, dynamic> json) {
    return SpaceImage(
      id:  (json['date'] + json['title']).hashCode,
      date: DateFormat('dd MMM, yyyy').format(
        DateTime.parse(
          json['date'],
        ),
      ),
      title: _getOrDefault(json, key: 'title', defaultValue: "No title"),
      explanation: _getOrDefault(json,
          key: 'explanation', defaultValue: "No explanation"),
      url: _getOrDefault(json, key: 'url', defaultValue: "No picture"),
      mediaType:
          _getOrDefault(json, key: 'media_type', defaultValue: "No typy"),
    );
  }

  int id;
  String date;
  String explanation;
  String mediaType;
  String title;
  String url;

  @override
  String toString() {
    return " $title, $url , $mediaType \n";
  }
}
