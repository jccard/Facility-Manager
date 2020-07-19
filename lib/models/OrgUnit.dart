import 'package:flutter/material.dart';

abstract class OrgUnit {
  //region COMMON PROPERTIES
  int id;
  String name;
  String image;
  Icon icon;
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

  //region CONSTRUCTOR
  OrgUnit ({
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
  });
  //endregion

  //region COMMON FUNCTIONS
  String getName() {
    return this.name;
  }

  String getImage() {
    return this.image;
  }

  Icon getIcon() {
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