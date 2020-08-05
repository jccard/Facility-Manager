import 'package:flutter/material.dart';

class Gadget {
  // PROPERTIES //
  int id;
  String displayName;
  String displayImage;
  Color displayBackgroundColor;
  //Icon displayIcon;
  String shortDescription;
  String longDescription;
  //String[] modifierTags;
  
  bool isActive;
  int quantity;
  double baseUnitValue;
  double currentUnitValue;
  //Modifier[] currentAdditiveModifiers;
  //Modifier[] currentMultiplicativeModifiers;

  String generatedResource;
  int generatedResourcePerCycle;
  // properties //

  // CONSTRUCTOR //
  Gadget({
    // display
    this.id,
    this.displayName,
    this.displayImage,
    this.displayBackgroundColor,
    //this.displayIcon,
    this.shortDescription,
    this.longDescription,
    // stats
    this.isActive,
    this.quantity,
    this.baseUnitValue,
    this.currentUnitValue,
    //this.modifierTags,
    //this.currentAdditiveModifiers,
    //this.currentMultiplicativeModifiers,
  });
  // constructor //

  // METHODS //
  void updateQuantity(int updateValue) {
    this.quantity += updateValue;
  }

//  TODO research using String[]
//  void updateCurrentAdditiveModifiers(String[] updatedAdditiveModifiers) {
//    this.currentAdditiveModifiers = updatedAdditiveModifiers;
//  }

  void updateCurrentUnitValue() {
    // TODO determine math for calculating currentUnitValue
  }
}
