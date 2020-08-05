import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//models
import 'package:shop_app/models/Facility.dart';
import 'package:shop_app/models/ProdLine.dart';


class FacilityManager extends ChangeNotifier {
  Facility _facility;

  //region FACILITIES
  //future use - user buys new facility
  //FacilityManager.fromData({});

  void addFromMain(Facility facility) {
    _facility = facility;
  }

  double getFacilityCurrentCash() {
    return _facility.getCurrentCash();
  }

  String displayFacilityCurrentCash() {
    var sn = new NumberFormat.scientificPattern();
    return sn.format(_facility.getCurrentCash());
  }

  void updateFacilityCurrentCash() {
    _facility.currentCash += _facility.getGrossIncomePerCycle();
    notifyListeners();
  }

  void decreaseFacilityCurrentCash(int amount) {
    _facility.decreaseCurrentCash(amount);
    notifyListeners();
  }
  //endregion facilities

  //region PROD LINES
  int getProdLinesCount() {
    return _facility.productionLines.length;
  }

  ProdLine getProdLineAt(int index) {
    return _facility.productionLines[index];
  }

  Color getProdLineBackgroundColorAt(int index) {
    return _facility.productionLines[index].backgroundColor;
  }

  String getProdLineNameAt(int index) {
    return _facility.productionLines[index].name;
  }

  int getProdLineIdAt(int index) {
    return _facility.productionLines[index].id;
  }

  String getProdLineImagePathAt(int index) {
    return _facility.productionLines[index].image;
  }
  //endregion prod lines

  //region DEPARTMENTS
  double getDeptGrossIncomePerCycleAt(ProdLine prodLine, int dept) {
    return prodLine.departments[dept].grossIncomePerCycle;
  }
  //endregion departments

  //region EMPLOYEES
  void levelUpEmployeeAt(ProdLine prodLine, int dept, int emp, int numLvls) {
    prodLine.departments[dept].teamMembers[emp].increaseLevelBy(numLvls);
    _facility.updateGrossIncomePerCycle();
    notifyListeners();
  }
  //endregion employees

  //region GET ICONS - will return to these
//  IconData getDeptArchIconDataAtIndex(int index) {
//    return facilities[_currentFacilityIndex]
//        .subOrgUnits[index]
//        .getArchetypeIconData();
//  }
//
//  IconData getDeptSubIconDataAtIndex(int index) {
//    return facilities[_currentFacilityIndex]
//        .subOrgUnits[index]
//        .getSubtypeIconData();
//  }
//
//  IconData getSubDeptArchIconDataAtIndex(int index) {
//    return facilities[_currentFacilityIndex]
//        .subOrgUnits[_currentDepartmentIndex]
//        .subOrgUnits[index]
//        .getArchetypeIconData();
//  }
//
//  IconData getSubDeptSubIconDataAtIndex(int index) {
//    return facilities[_currentFacilityIndex]
//        .subOrgUnits[_currentDepartmentIndex]
//        .subOrgUnits[index]
//        .getSubtypeIconData();
//  }
  //endregion
}