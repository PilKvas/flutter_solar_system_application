import 'dart:convert';
import 'dart:io';

getJson() async {
  return await (File('assets/dart.json')).readAsString();
}

var planetAsset = json.decode(getJson());



// final planet = planetFromJson(jsonString);

// List<Planet> planetFromJson(String str) => List<Planet>.from(json.decode(str).map((x) => Planet.fromJson(x)));

// String planetToJson(List<Planet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Planet {
//     Planet({
//         required this.name,
//         required this.overview,
//         required this.structure,
//         required this.geology,
//         required this.rotation,
//         required this.revolution,
//         required this.radius,
//         required this.temperature,
//         required this.images,
//     });

//     String name;
//     Geology overview;
//     Geology structure;
//     Geology geology;
//     String rotation;
//     String revolution;
//     String radius;
//     String temperature;
//     Images images;

//     factory Planet.fromJson(Map<String, dynamic> json) => Planet(
//         name: json["name"],
//         overview: Geology.fromJson(json["overview"]),
//         structure: Geology.fromJson(json["structure"]),
//         geology: Geology.fromJson(json["geology"]),
//         rotation: json["rotation"],
//         revolution: json["revolution"],
//         radius: json["radius"],
//         temperature: json["temperature"],
//         images: Images.fromJson(json["images"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "overview": overview.toJson(),
//         "structure": structure.toJson(),
//         "geology": geology.toJson(),
//         "rotation": rotation,
//         "revolution": revolution,
//         "radius": radius,
//         "temperature": temperature,
//         "images": images.toJson(),
//     };
// }

// class Geology {
//     Geology({
//         required this.content,
//         required this.source,
//     });

//     String content;
//     String source;

//     factory Geology.fromJson(Map<String, dynamic> json) => Geology(
//         content: json["content"],
//         source: json["source"],
//     );

//     Map<String, dynamic> toJson() => {
//         "content": content,
//         "source": source,
//     };
// }

// class Images {
//     Images({
//         required this.planet,
//         required this.internal,
//         required this.geology,
//     });

//     String planet;
//     String internal;
//     String geology;

//     factory Images.fromJson(Map<String, dynamic> json) => Images(
//         planet: json["planet"],
//         internal: json["internal"],
//         geology: json["geology"],
//     );

//     Map<String, dynamic> toJson() => {
//         "planet": planet,
//         "internal": internal,
//         "geology": geology,
//     };
// }

// Map<String, dynamic> planetMap = jsonDecode(jsonString);

// var planet = Planet.fromJson(planetMap);

