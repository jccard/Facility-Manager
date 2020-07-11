import 'package:flutter/material.dart';

class Project {
  /// PROPERTIES ///
  int id;
  String displayName;
  String displayImage;
  Icon displayTypeIcon;
  Icon displayLevelIcon;
  Color displayBackgroundColor;
  Color displayPrimaryColor;
  Color displaySecondaryColor;
  Color displayAccentColor;
  String shortDescription;
  String longDescription;
  //
  bool isActive;
  double manufacturingMultiplier;
  double teamsMultiplier;
  double projectMultiplier;
  //List<Modifier> currentAdditiveModifiers;
  //List<Modifier> currentMultiplicativeModifiers;

  /// CONSTRUCTOR ///
  Project({
    this.id,
    this.displayName,
    this.displayImage,
    this.displayTypeIcon,
    this.displayLevelIcon,
    this.displayBackgroundColor,
    this.displayPrimaryColor,
    this.displaySecondaryColor,
    this.displayAccentColor,
    this.shortDescription,
    this.longDescription,
    //
    this.isActive,
    this.manufacturingMultiplier,
    this.teamsMultiplier,
    this.projectMultiplier,
    //this.currentAdditiveModifiers,
    //this.currentMultiplicativeModifiers,
  });
}