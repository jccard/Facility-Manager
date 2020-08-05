import 'package:flutter/material.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shop_app/models/Modifier.dart';

@jsonSerializable
class ProdLine {
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
  List<Modifier> modifiers;
  List<ProdLineDepartment> departments;
  List<ProdLineDepartment> research;
  //endregion

  //region CONSTRUCTOR
  ProdLine (
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
    this.modifiers,
    this.departments,
    this.research
  );

  int getId() {
    return this.id;
  }

  String getImagePath() {
    return this.image;
  }

  Color getBgColor() {
    return this.backgroundColor;
  }

  String getName() {
    return this.name;
  }

  String getShortDescription() {
    return this.shortDescription;
  }

  String getLongDescription() {
    return this.longDescription;
  }

  double getGrossIncomePerCycle() {
    return this.grossIncomePerCycle;
  }

  void updateGrossIncomePerCycle() {
    this.grossIncomePerCycle = 0;
    for (var i = 0; i < departments.length; i++) {
      departments[i].updateDeptGrossIncomePerCycle();
      this.grossIncomePerCycle += departments[i].grossIncomePerCycle;
    }
  }
}

@jsonSerializable
class ProdLineDepartment {
  int id;
  String name;
  String image;
  String archetypeIcon;
  String subtypeIcon;
  bool active;
  double grossIncomePerCycle;
  double netIncomePerCycle;
  List<Modifier> modifiers;
  List<Employee> teamMembers;

  ProdLineDepartment (
    this.id,
    this.name,
    this.image,
    this.archetypeIcon,
    this.subtypeIcon,
    this.active,
    this.grossIncomePerCycle,
    this.netIncomePerCycle,
    this.modifiers,
    this.teamMembers
  );

  IconData getArchetypeIconData() {
    return this.archetypeIcon != null
        ? MdiIcons.fromString(this.archetypeIcon)
        : MdiIcons.fromString('help-circle');
  }

  void updateDeptGrossIncomePerCycle() {
    this.grossIncomePerCycle = 0;
    for (var i = 0; i < teamMembers.length; i++) {
      this.grossIncomePerCycle += teamMembers[i].grossIncomePerCycle;
    }
  }

  double getGrossIncomePerCycleAt() {
    return this.grossIncomePerCycle;
  }

  String displayGrossIncomePerCycle() {
    var sn = new NumberFormat.scientificPattern();
    return sn.format(this.grossIncomePerCycle);
  }
}

@jsonSerializable
class Employee {
  int id;
  String name;
  String image;
  String archetypeIcon;
  String subtypeIcon;
  bool active;
  int level;
  int toNextLevel;
  double grossIncomePerCycle;
  double netIncomePerCycle;
  List<Modifier> modifiers;

  Employee (
    this.id,
    this.name,
    this.image,
    this.archetypeIcon,
    this.subtypeIcon,
    this.active,
    this.level,
    this.toNextLevel,
    this.grossIncomePerCycle,
    this.netIncomePerCycle,
    this.modifiers
  );

  double getTeamsMultiAt(int index) {
    return this.modifiers[index].getTeamsMulti();
  }

  int getLevelAt() {
    return this.level;
  }

  int getToNextLevelAt() {
    return this.toNextLevel;
  }

  String displayToNextLevel() {
    var sn = new NumberFormat.scientificPattern();
    return sn.format(this.toNextLevel);
  }

  void increaseLevelBy(int numLvls) {
    this.level += numLvls;
    for (var i = 0; i < numLvls; i++) {
      this.toNextLevel += (this.toNextLevel * 1.15).round();
      this.grossIncomePerCycle += (this.grossIncomePerCycle * 1.15).round();
    }
  }
}