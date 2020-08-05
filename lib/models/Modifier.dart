import 'package:flutter/material.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Modifier {
  int id;
  String name;
  String image;
  String archetypeIcon;
  String subtypeIcon;
  String shortDescription;
  String longDescription;
  bool active;
  double manufacturingAdd;
  double manufacturingMulti;
  double teamsAdd;
  double teamsMulti;
  double researchAdd;
  double researchMulti;

  Modifier (
    this.id,
    this.name,
    this.image,
    this.archetypeIcon,
    this.subtypeIcon,
    this.shortDescription,
    this.longDescription,
    this.active,
    this.manufacturingAdd,
    this.manufacturingMulti,
    this.researchAdd,
    this.researchMulti,
    this.teamsAdd,
    this.teamsMulti
    );

  double getTeamsMulti() {
    return this.teamsMulti;
  }
}