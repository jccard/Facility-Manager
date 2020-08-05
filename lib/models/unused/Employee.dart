import 'package:flutter/material.dart';

class Employee {
  /// PROPERTIES ///
  int id;
  String displayName;
  String displayImage;
  Icon displayTierIcon;
  Color displayBackgroundColor;
  Color displayPrimaryColor;
  Color displaySecondaryColor;
  Color displayAccentColor;
  String shortDescription;
  String longDescription;
  //
  bool isActive;
  bool isTeamLeader;
  double manufacturingMultiplier;
  double teamsMultiplier;
  double projectMultiplier;
  //List<Modifier> currentAdditiveModifiers;
  //List<Modifier> currentMultiplicativeModifiers;

  /// CONSTRUCTOR ///
  Employee({
    this.id,
    this.displayName,
    this.displayImage,
    this.displayTierIcon,
    this.displayBackgroundColor,
    this.displayPrimaryColor,
    this.displaySecondaryColor,
    this.displayAccentColor,
    this.shortDescription,
    this.longDescription,
    //
    this.isActive,
    this.isTeamLeader,
    this.manufacturingMultiplier,
    this.teamsMultiplier,
    this.projectMultiplier,
    //this.currentAdditiveModifiers,
    //this.currentMultiplicativeModifiers,
  });

  /// DISPLAY AS WIDGET ///

  Widget statsPanelDisplay() {
    return Container(
      child: Text('Hooray, it worked!')
    );
  }
}