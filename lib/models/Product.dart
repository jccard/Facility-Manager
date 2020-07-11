import 'package:flutter/material.dart';

enum ProductArchetype { gadget, drone, transport }
enum ProductSubtype { defense, offense, utility }

class Product {
  /// PROPERTIES ///
  int id;
  String displayName;
  String displayImage;
  Color displayBackgroundColor;
  Icon displayArchetypeIcon;
  Icon displaySubtypeIcon;
  String shortDescription;
  String longDescription;

  bool isActive;
  int quantity;
  double baseUnitValue;
  double currentUnitValue;
  //Modifier[] currentAdditiveModifiers;
  //Modifier[] currentMultiplicativeModifiers;

  String generatedResource;
  int generatedResourcePerCycle;


  /// CONSTRUCTOR ///
  Product ({
    // display
    this.id,
    this.displayName,
    this.displayImage,
    this.displayBackgroundColor,
    this.displayArchetypeIcon,
    this.displaySubtypeIcon,
    this.shortDescription,
    this.longDescription,
    // stats
    this.isActive,
    this.quantity,
    this.baseUnitValue,
    this.currentUnitValue,
    //this.currentAdditiveModifiers,
    //this.currentMultiplicativeModifiers,
  });


  /// FUNCTIONS ///
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

  Widget statsPanelDisplay() {
    return Container(
        child: Text('Hooray, it worked! You are viewing ${this.displayName}')
    );
  }
}
