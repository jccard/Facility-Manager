import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//models
import 'package:shop_app/models/Facility.dart';

class FacilityManager extends ChangeNotifier {
  final List<Facility> facilities = [];
  int _currentFacilityIndex = 0;
  int _currentDepartmentIndex = 0;
  int _currentSubDepartmentIndex= 0;

  //FacilityManager.fromData({});

  void addFromMain(Facility facility) {
    facilities.add(facility);
  }

  int getFacilityCount() {
    return facilities.length;
  }

  //region INDICES getters/setters
  int getCurrentFacilityIndex() {
    return _currentFacilityIndex;
  }

  int getCurrentDepartmentIndex() {
    return _currentDepartmentIndex;
  }

  int getCurrentSubDepartmentIndex() {
    return _currentSubDepartmentIndex;
  }

  void updateCurrentFacilityIndex(int newIndex) {
    print('Updating _currentFacilityIndex to: ${newIndex}');
    _currentFacilityIndex = newIndex;
    updateCurrentDepartmentIndex(0);
    updateCurrentSubDepartmentIndex(0);
    notifyListeners();
  }

  void updateCurrentDepartmentIndex(int newIndex) {
    print('Updating _currentDepartmentIndex to: ${newIndex}');
    _currentDepartmentIndex = newIndex;
    updateCurrentSubDepartmentIndex(0);
    notifyListeners();
  }

  void updateCurrentSubDepartmentIndex(int newIndex) {
    print('Updating _currentSubDepartmentIndex to: ${newIndex}');
    _currentSubDepartmentIndex = newIndex;
    notifyListeners();
  }
  //endregion

  Icon getSubDepartmentIconAtIndex(int index) {
    print('Getting the icon for the SubDepartment at index: ${index}');
    return Icon(MdiIcons.fromString(facilities[_currentFacilityIndex]
        .departments[_currentDepartmentIndex]
        .subDepartments[index]
        .getIcon()
    ));
  }
}