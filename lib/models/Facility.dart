import 'package:flutter/material.dart';
import 'employee_icons.dart';
import 'facility_icons.dart';
import 'product_icons.dart';
import 'project_icons.dart';

import 'Product.dart';
import 'Employee.dart';
import 'Project.dart';

enum FacilityTier { shop, plant, factory }

class Facility {
  /// PROPERTIES ///
  int id;
  String displayName;
  String displayImage;
  Icon displayTierIcon;
  Color displayBackgroundColor;
  Color displayPrimaryColor;
  Color displaySecondaryColor;
  Color displayAccentColor;
  FacilityTier facilityTier;
  String shortDescription;
  String longDescription;
  //
  bool isActive;
  double grossIncomePerCycle;
  double netIncomePerCycle;
  //List<Modifier> currentAdditiveModifiers;
  //List<Modifier> currentMultiplicativeModifiers;
  //
  List<Product> manufacturing;
  List<Employee> teams;
  List<Project> research;
  // properties //

  /// CONSTRUCTOR ///
  Facility({
    // display
    this.id,
    this.displayName,
    this.displayImage,
    this.displayBackgroundColor,
    this.displayTierIcon,
    this.shortDescription,
    this.longDescription,
    // stats
    this.isActive,
    this.grossIncomePerCycle,
    this.netIncomePerCycle,
    //this.currentAdditiveModifiers,
    //this.currentMultiplicativeModifiers,
    this.manufacturing,
    this.teams,
    this.research,
  });
  // constructor //

  // METHODS //
//  TODO research using String[]
//  void updateCurrentAdditiveModifiers(String[] updatedAdditiveModifiers) {
//    this.currentAdditiveModifiers = updatedAdditiveModifiers;
//  }

  void updateCurrentUnitValue() {
    // TODO determine math for calculating currentUnitValue
  }
}

List<Facility> facilities = [
  Facility(
    // display
    id: 1,
    displayName: "facility_01",
    displayImage: "assets/images/facilities/Factory_01.png",
    displayBackgroundColor: Color(0xFF3D82AE),
    displayTierIcon: Icon(FacilityIcons.tier_1),
    shortDescription: "short description",
    longDescription: "a longer description, with more words",
    // stats
    isActive: true,
    grossIncomePerCycle: 5,
    netIncomePerCycle: 5,
    //this.modifierTags,
    //currentAdditiveModifiers,
    //currentMultiplicativeModifiers,
    manufacturing: [
      Product (
        // display
        id: 1,
        displayName: "facility_01",
        displayImage: "assets/images/rpg_image_pack/cloth/cs_t_01.PNG",
        displayBackgroundColor: Color(0xFF3D82AE),
        displayArchetypeIcon: Icon(ProductIcons.gadget),
        displaySubtypeIcon: Icon(ProductIcons.defense),
        shortDescription: "short description",
        longDescription: "a longer description, with more words",
        // stats
        isActive: true,
        quantity: 1,
        baseUnitValue: 5,
        currentUnitValue: 5,
        //this.modifierTags,
        //currentAdditiveModifiers,
        //currentMultiplicativeModifiers,
      ),
      Product (
        // display
        id: 2,
        displayName: "facility_02",
        displayImage: "assets/images/rpg_image_pack/cloth/cs_t_02.png",
        displayBackgroundColor: Color(0xFF989493),
        displayArchetypeIcon: Icon(ProductIcons.gadget),
        displaySubtypeIcon: Icon(ProductIcons.offense),
        shortDescription: "short description 02",
        longDescription: "a longer description, with more words 02",
        // stats
        isActive: false,
        quantity: 0,
        baseUnitValue: 8,
        currentUnitValue: 8,
        //this.modifierTags,
        //currentAdditiveModifiers,
        //currentMultiplicativeModifiers,
      ),
      Product (
        // display
        id: 3,
        displayName: "facility_03",
        displayImage: "assets/images/rpg_image_pack/cloth/cs_t_03.png",
        displayBackgroundColor: Color(0xFFD3A984),
        displayArchetypeIcon: Icon(ProductIcons.drone),
        displaySubtypeIcon: Icon(ProductIcons.utility),
        shortDescription: "short description 03",
        longDescription: "a longer description, with more words 03",
        // stats
        isActive: false,
        quantity: 0,
        baseUnitValue: 12,
        currentUnitValue: 12,
        //this.modifierTags,
        //currentAdditiveModifiers,
        //currentMultiplicativeModifiers,
      ),
    ],
    teams: [
      Employee (
          id: 1,
          displayName: "Alan Allens",
          displayTierIcon: Icon(EmployeeIcons.teamleader),
          displayBackgroundColor: Color(0xFF989493),
          isActive: true,
          isTeamLeader: false,
          manufacturingMultiplier: 1.1,
          teamsMultiplier: 1.2,
          projectMultiplier: 1.25,
      ),
      Employee (
        id: 2,
        displayName: "Mary Marsons",
        displayTierIcon: Icon(EmployeeIcons.teammember),
        displayBackgroundColor: Color(0xFF3D82AE),
        isActive: true,
        isTeamLeader: false,
        manufacturingMultiplier: 0.8,
        teamsMultiplier: 1.3,
        projectMultiplier: 1.0,
      ),
      Employee (
        id: 3,
        displayName: "Jeff Jeffries",
        displayTierIcon: Icon(EmployeeIcons.teammember),
        displayBackgroundColor: Color(0xFF989493),
        isActive: true,
        isTeamLeader: false,
        manufacturingMultiplier: 1.17,
        teamsMultiplier: 1.13,
        projectMultiplier: 1.22,
      ),
      Employee (
        id: 3,
        displayName: "Mark Markers",
        displayTierIcon: Icon(EmployeeIcons.teammember),
        displayBackgroundColor: Color(0xFF989493),
        isActive: true,
        isTeamLeader: false,
        manufacturingMultiplier: 1.17,
        teamsMultiplier: 1.13,
        projectMultiplier: 1.22,
      ),
    ],
    research: [
      Project (
        id: 1,
        displayName: "Ballistics",
        displayTypeIcon: Icon(ProjectIcons.type_1),
        displayLevelIcon: Icon(ProjectIcons.level_2),
        displayBackgroundColor: Color(0xFF989493),
        isActive: true,
        manufacturingMultiplier: 1.1,
        teamsMultiplier: 1.2,
        projectMultiplier: 1.25,
      ),
      Project (
        id: 2,
        displayName: "Optics",
        displayTypeIcon: Icon(ProjectIcons.type_3),
        displayLevelIcon: Icon(ProjectIcons.level_4),
        displayBackgroundColor: Color(0xFF3D82AE),
        isActive: true,
        manufacturingMultiplier: 1.1,
        teamsMultiplier: 1.2,
        projectMultiplier: 1.25,
      ),
    ],
  ),
  Facility(
    // display
    id: 2,
    displayName: "facility_02",
    displayImage: "assets/images/facilities/Factory_02.png",
    displayBackgroundColor: Color(0xFF989493),
    displayTierIcon: Icon(FacilityIcons.tier_1),
    shortDescription: "short description 02",
    longDescription: "a longer description, with more words 02",
    // stats
    isActive: false,
    grossIncomePerCycle: 8,
    netIncomePerCycle: 8,
    //this.modifierTags,
    //currentAdditiveModifiers,
    //currentMultiplicativeModifiers,
    manufacturing: [
      Product (
        // display
        id: 1,
        displayName: "facility_01",
        displayImage: "assets/images/rpg_image_pack/cloth/cs_t_01.PNG",
        displayBackgroundColor: Color(0xFF3D82AE),
        displayArchetypeIcon: Icon(ProductIcons.transport),
        displaySubtypeIcon: Icon(ProductIcons.defense),
        shortDescription: "short description",
        longDescription: "a longer description, with more words",
        // stats
        isActive: true,
        quantity: 1,
        baseUnitValue: 5,
        currentUnitValue: 5,
        //this.modifierTags,
        //currentAdditiveModifiers,
        //currentMultiplicativeModifiers,
      ),
      Product (
        // display
        id: 2,
        displayName: "facility_02",
        displayImage: "assets/images/rpg_image_pack/cloth/cs_t_02.png",
        displayBackgroundColor: Color(0xFF989493),
        displayArchetypeIcon: Icon(ProductIcons.gadget),
        displaySubtypeIcon: Icon(ProductIcons.offense),
        shortDescription: "short description 02",
        longDescription: "a longer description, with more words 02",
        // stats
        isActive: false,
        quantity: 0,
        baseUnitValue: 8,
        currentUnitValue: 8,
        //this.modifierTags,
        //currentAdditiveModifiers,
        //currentMultiplicativeModifiers,
      ),
    ],
    teams: [
      Employee (
        id: 1,
        displayName: "Alan Allens",
        displayTierIcon: Icon(EmployeeIcons.teamleader),
        displayBackgroundColor: Color(0xFF989493),
        isActive: true,
        isTeamLeader: false,
        manufacturingMultiplier: 1.1,
        teamsMultiplier: 1.2,
        projectMultiplier: 1.25,
      ),
      Employee (
        id: 2,
        displayName: "Mary Marsons",
        displayTierIcon: Icon(EmployeeIcons.teammember),
        displayBackgroundColor: Color(0xFF3D82AE),
        isActive: true,
        isTeamLeader: false,
        manufacturingMultiplier: 0.8,
        teamsMultiplier: 1.3,
        projectMultiplier: 1.0,
      ),
      Employee (
        id: 3,
        displayName: "Jeff Jeffries",
        displayTierIcon: Icon(EmployeeIcons.teammember),
        displayBackgroundColor: Color(0xFF989493),
        isActive: true,
        isTeamLeader: false,
        manufacturingMultiplier: 1.17,
        teamsMultiplier: 1.13,
        projectMultiplier: 1.22,
      ),
      Employee (
        id: 3,
        displayName: "Dave Davies",
        displayTierIcon: Icon(EmployeeIcons.teammember),
        displayBackgroundColor: Color(0xFF989493),
        isActive: true,
        isTeamLeader: false,
        manufacturingMultiplier: 1.17,
        teamsMultiplier: 1.13,
        projectMultiplier: 1.22,
      ),
    ],
    research: [
      Project (
        id: 1,
        displayName: "Ballistics",
        displayTypeIcon: Icon(ProjectIcons.type_1),
        displayLevelIcon: Icon(ProjectIcons.level_1),
        displayBackgroundColor: Color(0xFF989493),
        isActive: true,
        manufacturingMultiplier: 1.1,
        teamsMultiplier: 1.2,
        projectMultiplier: 1.25,
      ),
      Project (
        id: 2,
        displayName: "Optics",
        displayTypeIcon: Icon(ProjectIcons.type_2),
        displayLevelIcon: Icon(ProjectIcons.level_5),
        displayBackgroundColor: Color(0xFF3D82AE),
        isActive: true,
        manufacturingMultiplier: 1.1,
        teamsMultiplier: 1.2,
        projectMultiplier: 1.25,
      ),
    ],
  ),
  Facility(
    // display
    id: 3,
    displayName: "facility_03",
    displayImage: "assets/images/facilities/Factory_03.png",
    displayBackgroundColor: Color(0xFFD3A984),
    displayTierIcon: Icon(FacilityIcons.tier_1),
    shortDescription: "short description 03",
    longDescription: "a longer description, with more words 03",
    // stats
    isActive: false,
    grossIncomePerCycle: 12,
    netIncomePerCycle: 12,
    //this.modifierTags,
    //currentAdditiveModifiers,
    //currentMultiplicativeModifiers,
    manufacturing: [
      Product (
        // display
        id: 1,
        displayName: "facility_01",
        displayImage: "assets/images/rpg_image_pack/cloth/cs_t_01.PNG",
        displayBackgroundColor: Color(0xFF3D82AE),
        displayArchetypeIcon: Icon(ProductIcons.drone),
        displaySubtypeIcon: Icon(ProductIcons.defense),
        shortDescription: "short description",
        longDescription: "a longer description, with more words",
        // stats
        isActive: true,
        quantity: 1,
        baseUnitValue: 5,
        currentUnitValue: 5,
        //this.modifierTags,
        //currentAdditiveModifiers,
        //currentMultiplicativeModifiers,
      ),
    ],
    teams: [
      Employee (
        id: 1,
        displayName: "Alan Allens",
        displayTierIcon: Icon(EmployeeIcons.teammember),
        displayBackgroundColor: Color(0xFF989493),
        isActive: true,
        isTeamLeader: false,
        manufacturingMultiplier: 1.1,
        teamsMultiplier: 1.2,
        projectMultiplier: 1.25,
      ),
      Employee (
        id: 2,
        displayName: "Mary Marsons",
        displayTierIcon: Icon(EmployeeIcons.teamleader),
        displayBackgroundColor: Color(0xFF3D82AE),
        isActive: true,
        isTeamLeader: false,
        manufacturingMultiplier: 0.8,
        teamsMultiplier: 1.3,
        projectMultiplier: 1.0,
      ),
      Employee (
        id: 3,
        displayName: "Jeff Jeffries",
        displayTierIcon: Icon(EmployeeIcons.teammember),
        displayBackgroundColor: Color(0xFF989493),
        isActive: true,
        isTeamLeader: false,
        manufacturingMultiplier: 1.17,
        teamsMultiplier: 1.13,
        projectMultiplier: 1.22,
      ),
      Employee (
        id: 3,
        displayName: "Michelle Mitchells",
        displayTierIcon: Icon(EmployeeIcons.teammember),
        displayBackgroundColor: Color(0xFF989493),
        isActive: true,
        isTeamLeader: false,
        manufacturingMultiplier: 1.07,
        teamsMultiplier: 1.03,
        projectMultiplier: 0.92,
      ),
    ],
    research: [
      Project (
        id: 1,
        displayName: "Ballistics",
        displayTypeIcon: Icon(ProjectIcons.type_3),
        displayLevelIcon: Icon(ProjectIcons.level_2),
        displayBackgroundColor: Color(0xFF989493),
        isActive: true,
        manufacturingMultiplier: 1.1,
        teamsMultiplier: 1.2,
        projectMultiplier: 1.25,
      ),
      Project (
        id: 2,
        displayName: "Optics",
        displayTypeIcon: Icon(ProjectIcons.type_1),
        displayLevelIcon: Icon(ProjectIcons.level_6),
        displayBackgroundColor: Color(0xFF3D82AE),
        isActive: true,
        manufacturingMultiplier: 1.1,
        teamsMultiplier: 1.2,
        projectMultiplier: 1.25,
      ),
    ],
  ),
];
