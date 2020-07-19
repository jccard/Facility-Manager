/*
The Facility is the top-level entity that the Player manages.

It is comprised of Departments, which are in turn comprised of SubDepartments.

Each of the SubDepartments generates something of value, or potential value.
Those values are aggregated up through to the Facility, to make getting the total
 value per cycle easier to calculate.
 */

import 'package:flutter/material.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
//models
import 'package:shop_app/models/Department.dart';

//FacilityTier { shop, plant, factory }

//removed extends to make PoC for JSON constructor
//class Facility extends OrgUnit {

@jsonSerializable
class Facility {
  //some are commented out to try JSON
  //if it works, will need to update to String based
  //eg: Icon icon updated to String iconPath;
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

  //region CLASS SPECIFIC PROPERTIES
//  String facilityTier;
//  Icon tierIcon;
//  String tierIconPath;
  List<Department> departments;
  //endregion

  //region CLASS SPECIFIC CONSTRUCTORS
  Facility({
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
//    this.currentAdditiveModifiers,
//    this.currentMultiplicativeModifiers,
//    //class specific properties
//    this.facilityTier,
//    this.tierIcon,
//    this.tierIconPath,
    this.departments,
  });
  //endregion

  //region CONSTRUCTOR HELPERS
  // TODO: create constructor helper for icons in Facility
  // update the icons in JSON to use a iconLib string
  // in addition to the name of the icon
  // then I can use those together to create the icon
  // using a
  //endregion

  //region COMMON FUNCTIONS
  //region GETTERS
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
  //endregion
  //region SETTERS
  double updateGrossIncomePerCycle(double) {
    grossIncomePerCycle = double;
    //notifyListeners();
  }
  //endregion

  /*
    List<Modifier> getCurrentAdditiveModifiers () {
      return this.currentAdditiveModifiers;
    }

    List<Modifier> currentMultiplicativeModifiers () {
      return this.currentMultiplicativeModifiers;
    }
  */
  //endregion

  //region CLASS SPECIFIC FUNCTIONS
  //endregion
}
