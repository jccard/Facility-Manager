import 'package:flutter/material.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:shop_app/models/ProdLine.dart';
import 'package:shop_app/models/Modifier.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

@jsonSerializable
class Facility {
  //region PROPERTIES
  int id;
  String name;
  String image;
  String archetypeIcon;
  String subtypeIcon;
  Color backgroundColor;
  Color primaryColor;
  Color secondaryColor;
  Color accentColor;
  String shortDescription;
  String longDescription;
  bool active;
  double grossIncomePerCycle;
  double netIncomePerCycle;
  double currentCash;
  List<Modifier> modifiers;
  List<ProdLine> productionLines;
  //endregion

  //region CONSTRUCTOR
  Facility (
    this.id,
    this.name,
    this.image,
    this.archetypeIcon,
    this.subtypeIcon,
    this.backgroundColor,
    this.primaryColor,
    this.secondaryColor,
    this.accentColor,
    this.shortDescription,
    this.longDescription,
    this.active,
    this.grossIncomePerCycle,
    this.netIncomePerCycle,
    this.currentCash,
    this.modifiers,
    this.productionLines
  );
  //endregion

  //region FUNCTIONS
  int getId() {
    return this.id;
  }

  String getName() {
    return this.name;
  }

  String getImage() {
    return this.image;
  }

  IconData getArchetypeIconData() {
    return this.archetypeIcon != null
      ? MdiIcons.fromString(this.archetypeIcon)
      : MdiIcons.fromString('help-circle');
  }

  IconData getSubtypeIconData() {
    return this.subtypeIcon != null
        //? Icon(MdiIcons.fromString(this.subtypeIcon))
        ? MdiIcons.fromString(this.subtypeIcon)
        : MdiIcons.fromString('help-circle');
  }

  Color getBackgroundColor() {
    return this.backgroundColor;
  }

  Color getPrimaryColor() {
    return this.primaryColor;
  }

  Color getSecondaryColor() {
    return this.secondaryColor;
  }

  Color getAccentColor() {
    return this.accentColor;
  }

  String getShortDescription() {
    return this.shortDescription;
  }

  String getLongDescription() {
    return this.longDescription;
  }

  bool isActive() {
    return this.active;
  }

  double getGrossIncomePerCycle() {
    return this.grossIncomePerCycle;
  }

  void updateGrossIncomePerCycle() {
    this.grossIncomePerCycle = 0;
    for (var i = 0; i < productionLines.length; i++) {
      productionLines[i].updateGrossIncomePerCycle();
      this.grossIncomePerCycle += productionLines[i].grossIncomePerCycle;
    }
  }

  double getNetIncomePerCycle() {
    //TODO after adding in Facility level modifiers, net becomes function of gross and mods
    return this.netIncomePerCycle;
  }

  double getCurrentCash() {
    return this.currentCash;
  }

  void increaseCurrentCash(int amount) {
    this.currentCash += amount;
  }

  void decreaseCurrentCash(int amount) {
    this.currentCash -= amount;
  }
  //endregion
}