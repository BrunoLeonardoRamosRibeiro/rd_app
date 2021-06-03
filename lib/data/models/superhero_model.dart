// To parse this JSON data, do
//
//     final superheroModel = superheroModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:rd_app/domain/entities/superhero.dart';

SuperheroModel superheroModelFromJson(String str) =>
    SuperheroModel.fromJson(json.decode(str));

String superheroModelToJson(SuperheroModel data) => json.encode(data.toJson());

class SuperheroModel extends Superhero {
  SuperheroModel({
    @required this.id,
    @required this.name,
    @required this.slug,
    @required this.powerstats,
    @required this.appearance,
    @required this.biography,
    @required this.work,
    @required this.connections,
    @required this.images,
  }) : super(
          id: id,
          name: name,
          slug: slug,
          powerstats: powerstats,
          appearance: appearance,
          biography: biography,
          work: work,
          connections: connections,
          images: images,
        );

  final int id;
  final String name;
  final String slug;
  final PowerstatsModel powerstats;
  final AppearanceModel appearance;
  final BiographyModel biography;
  final WorkModel work;
  final ConnectionsModel connections;
  final ImagesModel images;

  factory SuperheroModel.fromJson(Map<String, dynamic> json) => SuperheroModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        powerstats: PowerstatsModel.fromJson(json["powerstats"]),
        appearance: AppearanceModel.fromJson(json["appearance"]),
        biography: BiographyModel.fromJson(json["biography"]),
        work: WorkModel.fromJson(json["work"]),
        connections: ConnectionsModel.fromJson(json["connections"]),
        images: ImagesModel.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "powerstats": powerstats.toJson(),
        "appearance": appearance.toJson(),
        "biography": biography.toJson(),
        "work": work.toJson(),
        "connections": connections.toJson(),
        "images": images.toJson(),
      };
}

class AppearanceModel extends Appearance {
  AppearanceModel({
    @required this.gender,
    @required this.race,
    @required this.height,
    @required this.weight,
    @required this.eyeColor,
    @required this.hairColor,
  }) : super(
          gender: gender,
          race: race,
          height: height,
          weight: weight,
          eyeColor: eyeColor,
          hairColor: hairColor,
        );

  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  factory AppearanceModel.fromJson(Map<String, dynamic> json) =>
      AppearanceModel(
        gender: json["gender"],
        race: json["race"],
        height: List<String>.from(json["height"].map((x) => x)),
        weight: List<String>.from(json["weight"].map((x) => x)),
        eyeColor: json["eyeColor"],
        hairColor: json["hairColor"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "race": race,
        "height": List<dynamic>.from(height.map((x) => x)),
        "weight": List<dynamic>.from(weight.map((x) => x)),
        "eyeColor": eyeColor,
        "hairColor": hairColor,
      };
}

class BiographyModel extends Biography {
  BiographyModel({
    @required this.fullName,
    @required this.alterEgos,
    @required this.aliases,
    @required this.placeOfBirth,
    @required this.firstAppearance,
    @required this.publisher,
    @required this.alignment,
  }) : super(
          fullName: fullName,
          alterEgos: alterEgos,
          aliases: aliases,
          placeOfBirth: placeOfBirth,
          firstAppearance: firstAppearance,
          publisher: publisher,
          alignment: alignment,
        );

  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  factory BiographyModel.fromJson(Map<String, dynamic> json) => BiographyModel(
        fullName: json["fullName"],
        alterEgos: json["alterEgos"],
        aliases: List<String>.from(json["aliases"].map((x) => x)),
        placeOfBirth: json["placeOfBirth"],
        firstAppearance: json["firstAppearance"],
        publisher: json["publisher"],
        alignment: json["alignment"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "alterEgos": alterEgos,
        "aliases": List<dynamic>.from(aliases.map((x) => x)),
        "placeOfBirth": placeOfBirth,
        "firstAppearance": firstAppearance,
        "publisher": publisher,
        "alignment": alignment,
      };
}

class ConnectionsModel extends Connections {
  ConnectionsModel({
    @required this.groupAffiliation,
    @required this.relatives,
  }) : super(groupAffiliation: groupAffiliation, relatives: relatives);

  final String groupAffiliation;
  final String relatives;

  factory ConnectionsModel.fromJson(Map<String, dynamic> json) =>
      ConnectionsModel(
        groupAffiliation: json["groupAffiliation"],
        relatives: json["relatives"],
      );

  Map<String, dynamic> toJson() => {
        "groupAffiliation": groupAffiliation,
        "relatives": relatives,
      };
}

class ImagesModel extends Images {
  ImagesModel({
    @required this.xs,
    @required this.sm,
    @required this.md,
    @required this.lg,
  }) : super(
          xs: xs,
          sm: sm,
          md: md,
          lg: lg,
        );

  final String xs;
  final String sm;
  final String md;
  final String lg;

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
        xs: json["xs"],
        sm: json["sm"],
        md: json["md"],
        lg: json["lg"],
      );

  Map<String, dynamic> toJson() => {
        "xs": xs,
        "sm": sm,
        "md": md,
        "lg": lg,
      };
}

class PowerstatsModel extends Powerstats {
  PowerstatsModel({
    @required this.intelligence,
    @required this.strength,
    @required this.speed,
    @required this.durability,
    @required this.power,
    @required this.combat,
  }) : super(
          intelligence: intelligence,
          strength: strength,
          speed: speed,
          durability: durability,
          power: power,
          combat: combat,
        );

  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;

  factory PowerstatsModel.fromJson(Map<String, dynamic> json) =>
      PowerstatsModel(
        intelligence: json["intelligence"],
        strength: json["strength"],
        speed: json["speed"],
        durability: json["durability"],
        power: json["power"],
        combat: json["combat"],
      );

  Map<String, dynamic> toJson() => {
        "intelligence": intelligence,
        "strength": strength,
        "speed": speed,
        "durability": durability,
        "power": power,
        "combat": combat,
      };
}

class WorkModel extends Work {
  WorkModel({
    @required this.occupation,
    @required this.base,
  }) : super(occupation: occupation, base: base);

  final String occupation;
  final String base;

  factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        occupation: json["occupation"],
        base: json["base"],
      );

  Map<String, dynamic> toJson() => {
        "occupation": occupation,
        "base": base,
      };
}
