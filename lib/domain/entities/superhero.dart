import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Superhero extends Equatable {
  Superhero({
    @required this.id,
    @required this.name,
    @required this.slug,
    @required this.powerstats,
    @required this.appearance,
    @required this.biography,
    @required this.work,
    @required this.connections,
    @required this.images,
  });

  final int id;
  final String name;
  final String slug;
  final Powerstats powerstats;
  final Appearance appearance;
  final Biography biography;
  final Work work;
  final Connections connections;
  final Images images;

  @override
  List<Object> get props => [
        id,
        name,
        slug,
        powerstats,
        appearance,
        biography,
        work,
        connections,
        images
      ];
}

class Appearance extends Equatable {
  Appearance({
    @required this.gender,
    @required this.race,
    @required this.height,
    @required this.weight,
    @required this.eyeColor,
    @required this.hairColor,
  });

  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  @override
  List<Object> get props => [gender, race, height, weight, eyeColor, hairColor];
}

class Biography extends Equatable {
  Biography({
    @required this.fullName,
    @required this.alterEgos,
    @required this.aliases,
    @required this.placeOfBirth,
    @required this.firstAppearance,
    @required this.publisher,
    @required this.alignment,
  });

  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  @override
  List<Object> get props => [
        fullName,
        alterEgos,
        aliases,
        placeOfBirth,
        firstAppearance,
        publisher,
        alignment
      ];
}

class Connections extends Equatable {
  Connections({
    @required this.groupAffiliation,
    @required this.relatives,
  });

  final String groupAffiliation;
  final String relatives;

  @override
  List<Object> get props => [groupAffiliation, relatives];
}

class Images extends Equatable {
  Images({
    @required this.xs,
    @required this.sm,
    @required this.md,
    @required this.lg,
  });

  final String xs;
  final String sm;
  final String md;
  final String lg;

  @override
  List<Object> get props => [xs, sm, md, lg];
}

class Powerstats extends Equatable {
  Powerstats({
    @required this.intelligence,
    @required this.strength,
    @required this.speed,
    @required this.durability,
    @required this.power,
    @required this.combat,
  });

  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;

  @override
  List<Object> get props => [intelligence, strength, speed, durability, power, combat];
}

class Work extends Equatable{
  Work({
    @required this.occupation,
    @required this.base,
  });

  final String occupation;
  final String base;

  @override
  List<Object> get props => [occupation, base];
}
