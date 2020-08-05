/*
This class is the super class for the individual Facility Departments.
eg: Product, Employee, and Project

I want to have the common properties here, as well as any common functions.
I mean, that's the point of inherited classes.
The only function I can think of right now is the sub-department display on
 the statsPanel, but that is a good place to start. It will simplify the
 stats_panel.dart file.
 */

import 'package:flutter/material.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class SubDepartment {
  //region COMMON PROPERTIES
  int id;
  String name;
  String image;
  String icon;
  Color backgroundColor;
  Color primaryColor;
  Color secondaryColor;
  Color accentColor;
  String shortDescription;
  String longDescription;
  //
  bool active;
  double grossIncomePerCycle;
  double netIncomePerCycle;
  //List<Modifier> currentAdditiveModifiers;
  //List<Modifier> currentMultiplicativeModifiers;
  //endregion

  //region CLASS PROPERTIES
//  Icon archetypeIcon;
//  Icon subtypeIcon;
  //endregion

  //region CONSTRUCTOR
  SubDepartment ({
    //common properties
    this.id,
    this.name,
    this.image,
    this.icon,
    this.backgroundColor,
    this.primaryColor,
    this.secondaryColor,
    this.accentColor,
    this.shortDescription,
    this.longDescription,
    this.active,
    this.grossIncomePerCycle,
    this.netIncomePerCycle,
    //this.currentAdditiveModifiers,
    //this.currentMultiplicativeModifiers,
    //class properties
//    this.archetypeIcon,
//    this.subtypeIcon,
  });
  //endregion

  //region FUNCTIONS
  String getName() {
    return this.name;
  }

  String getImage() {
    return this.image;
  }

  String getIcon() {
    return this.icon;
  }

  Color getBackgroundColor() {
    return this.backgroundColor;
  }

  Color getPrimaryColor() {
    return this.primaryColor;
  }

  Color getSecondaryColor() {
    return this.primaryColor;
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

  double getNetIncomePerCycle() {
    return this.netIncomePerCycle;
  }

  /*
List<Modifier> getCurrentAdditiveModifiers () {
  return this.currentAdditiveModifiers;
}

List<Modifier> currentMultiplicativeModifiers () {
  return this.currentMultiplicativeModifiers;
}
  */
  //endregion
}
