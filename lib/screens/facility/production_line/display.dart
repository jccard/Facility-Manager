import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/services/facility-manager.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/ProdLine.dart';

class Display extends StatefulWidget {
  final ProdLine prodLine;

  Display({
    Key key,
    this.prodLine,
  }) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    double mainIconSize = 60.0;
    double subIconSize = 35.0;
    double currentCash =
    Provider.of<FacilityManager>(context).getFacilityCurrentCash();

    void levelUpEmployee(int dept, int employee) {
      print('level up employee');
      setState(() {
        //update the Facility total income
        Provider.of<FacilityManager>(context, listen: false)
            .decreaseFacilityCurrentCash(widget
            .prodLine.departments[dept].teamMembers[employee]
            .getToNextLevelAt());
        //update the employee level; that function should update the g/c
        //levelUpEmployeeAt also updates the grossIncomePerCycle, from Facility down
        Provider.of<FacilityManager>(context, listen: false)
            .levelUpEmployeeAt(widget.prodLine, dept, employee, 1);
      });
    }

    List<Widget> deptRows() {
      List<Widget> list = new List<Widget>();

      for (var i = 0; i < 3; i++) {
        list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    widget.prodLine.departments[i].getArchetypeIconData(),
                    size: mainIconSize,
                  ),
                  Text(
                      'G/C: ${widget.prodLine.departments[i]
                          .displayGrossIncomePerCycle()}'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      MdiIcons.fromString('alpha-l-circle'),
                      size: subIconSize,
                      color: (currentCash >=
                          widget.prodLine.departments[i].teamMembers[0]
                              .getToNextLevelAt())
                          ? Colors.green
                          : Colors.red,
                    ),
                    onPressed: () {
                      if (currentCash >=
                          widget.prodLine.departments[i].teamMembers[0]
                              .getToNextLevelAt()) {
                        levelUpEmployee(i, 0);
                      }
                    },
                  ),
                  Text(
                    'L ${widget.prodLine.departments[i].teamMembers[0]
                        .displayToNextLevel()}',
                    style: kDeptUpgradeStyle,
                  ),
                  Text(
                    'next: ${widget.prodLine.departments[i].teamMembers[0]
                        .displayToNextLevel()}',
                    style: kDeptUpgradeStyle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      MdiIcons.fromString('alpha-m-circle'),
                      size: subIconSize,
                      color: (currentCash >=
                          widget.prodLine.departments[i].teamMembers[1]
                              .getToNextLevelAt())
                          ? Colors.green
                          : Colors.red,
                    ),
                    onPressed: () {
                      if (currentCash >=
                          widget.prodLine.departments[i].teamMembers[1]
                              .getToNextLevelAt()) {
                        levelUpEmployee(i, 1);
                      }
                    },
                  ),
                  Text(
                    'L ${widget.prodLine.departments[i].teamMembers[1]
                        .displayToNextLevel()}',
                    style: kDeptUpgradeStyle,
                  ),
                  Text(
                    'next: ${widget.prodLine.departments[i].teamMembers[1]
                        .displayToNextLevel()}',
                    style: kDeptUpgradeStyle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      MdiIcons.fromString('alpha-m-circle'),
                      size: subIconSize,
                      color: (currentCash >=
                          widget.prodLine.departments[i].teamMembers[2]
                              .getToNextLevelAt())
                          ? Colors.green
                          : Colors.red,
                    ),
                    onPressed: () {
                      if (currentCash >=
                          widget.prodLine.departments[i].teamMembers[2]
                              .getToNextLevelAt()) {
                        levelUpEmployee(i, 2);
                      }
                    },
                  ),
                  Text(
                    'L ${widget.prodLine.departments[i].teamMembers[2]
                        .displayToNextLevel()}',
                    style: kDeptUpgradeStyle,
                  ),
                  Text(
                    'next: ${widget.prodLine.departments[i].teamMembers[2]
                        .displayToNextLevel()}',
                    style: kDeptUpgradeStyle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      MdiIcons.fromString('alpha-m-circle'),
                      size: subIconSize,
                      color: (currentCash >=
                          widget.prodLine.departments[i].teamMembers[3]
                              .getToNextLevelAt())
                          ? Colors.green
                          : Colors.red,
                    ),
                    onPressed: () {
                      if (currentCash >=
                          widget.prodLine.departments[i].teamMembers[3]
                              .getToNextLevelAt()) {
                        levelUpEmployee(i, 3);
                      }
                    },
                  ),
                  Text(
                    'L ${widget.prodLine.departments[i].teamMembers[3]
                        .displayToNextLevel()}',
                    style: kDeptUpgradeStyle,
                  ),
                  Text(
                    'next: ${widget.prodLine.departments[i].teamMembers[3]
                        .displayToNextLevel()}',
                    style: kDeptUpgradeStyle,
                  ),
                ],
              ),
            ],
          ),
      );

      if (i < 2) {
      list.add(Divider());
      }
    }
      return
      list;
    }

    return Column(
      children: deptRows(),
    );
  }
}

//Widget buildDeptRows(BuildContext context, ProdLine prodLine) {
//
//  List<Widget> list = new List<Widget>();
//  for (var i = 0; i < 3; i++) {
//    list.add(Row(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        Row(
//          children: <Widget>[
//            Icon(
//              prodLine.departments[i].getArchetypeIconData(),
//              size: mainIconSize,
//            ),
//            Column(
//              children: <Widget>[
//                Text('G/C: ##'),
//                Text('N/C: ##'),
//              ],
//            ),
//          ],
//        ),
//        Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                IconButton(
//                  icon: Icon(
//                    MdiIcons.fromString('alpha-l-circle'),
//                    size: subIconSize,
//                    color: (currentCash > prodLine.departments[i].teamMembers[0].getToNextLevelAt(0))
//                    ? Colors.green : Colors.red,
//                  ),
//                  onPressed: () {
////                    print('level up');
////                    levelUpEmployee(i, 0);
//                  },
//                ),
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      'L ${prodLine.departments[i].teamMembers[0].getLevelAt(0)}',
//                      style: kDeptUpgradeStyle,
//                    ),
//                    Text(
//                      'next: ${prodLine.departments[i].teamMembers[0].getToNextLevelAt(0)}',
//                      style: kDeptUpgradeStyle,
//                    ),
//                  ],
//                ),
//              ],
//            ),
//            Row(
//              children: <Widget>[
//                IconButton(
//                  icon: Icon(
//                    MdiIcons.fromString('alpha-m-circle'),
//                    size: subIconSize,
//                    color: (currentCash > prodLine.departments[i].teamMembers[1].getToNextLevelAt(0))
//                        ? Colors.green : Colors.red,
//                  ),
//                  onPressed: () {
//                    print('level up');
//                    levelUpEmployee(i, 1);
//                  },
//                ),
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      'L ${prodLine.departments[i].teamMembers[1].getLevelAt(0)}',
//                      style: kDeptUpgradeStyle,
//                    ),
//                    Text(
//                      'next: ${prodLine.departments[i].teamMembers[1].getToNextLevelAt(0)}',
//                      style: kDeptUpgradeStyle,
//                    ),
//                  ],
//                ),
//              ],
//            ),
//          ],
//        ),
//        Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                IconButton(
//                  icon: Icon(
//                    MdiIcons.fromString('alpha-m-circle'),
//                    size: subIconSize,
//                    color: (currentCash > prodLine.departments[i].teamMembers[2].getToNextLevelAt(0))
//                        ? Colors.green : Colors.red,
//                  ),
//                  onPressed: () {
//                    print('level up');
//                    levelUpEmployee(i, 2);
//                  },
//                ),
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      'L ${prodLine.departments[i].teamMembers[2].getLevelAt(0)}',
//                      style: kDeptUpgradeStyle,
//                    ),
//                    Text(
//                      'next: ${prodLine.departments[i].teamMembers[2].getToNextLevelAt(0)}',
//                      style: kDeptUpgradeStyle,
//                    ),
//                  ],
//                ),
//              ],
//            ),
//            Row(
//              children: <Widget>[
//                IconButton(
//                  icon: Icon(
//                    MdiIcons.fromString('alpha-m-circle'),
//                    size: subIconSize,
//                    color: (currentCash > prodLine.departments[i].teamMembers[3].getToNextLevelAt(0))
//                        ? Colors.green : Colors.red,
//                  ),
//                  onPressed: () {
//                    print('level up');
//                    levelUpEmployee(i, 3);
//                  },
//                ),
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      'L ${prodLine.departments[i].teamMembers[3].getLevelAt(0)}',
//                      style: kDeptUpgradeStyle,
//                    ),
//                    Text(
//                      'next: ${prodLine.departments[i].teamMembers[3].getToNextLevelAt(0)}',
//                      style: kDeptUpgradeStyle,
//                    ),
//                  ],
//                ),
//              ],
//            ),
//          ],
//        ),
//
////        Column(
////          children: <Widget>[Row(
////            children: <Widget>[
////              Icon(
////                prodLine.departments[i].getArchetypeIconData(),
////                size: mainIconSize,
////              ),
////              Wrap(
////                direction: Axis.vertical,
////                children: <Widget>[
////                  RotatedBox(
////                    quarterTurns: 3,
////                    child: Text('Prog Bar'),
////                  )
////                ],
////              ),
////              Column(
////                children: <Widget>[
////                  Row(
////                    children: <Widget>[
////                      Icon(
////                        MdiIcons.fromString('alpha-l-circle'),
////                        size: subIconSize,
////                      ),
////                      Column(
////                        children: <Widget>[
////                          Text(
////                              '+${prodLine.departments[i].teamMembers[0].getTeamsMultiAt(0)}%',
////                              style: kDeptUpgradeStyle,
////                          ),
////                          Text('+R%', style: kDeptUpgradeStyle),
////                        ],
////                      ),
////                      Icon(
////                        MdiIcons.fromString('alpha-m-circle'),
////                        size: subIconSize,
////                      ),
////                      Column(
////                        children: <Widget>[
////                          Text(
////                            '+${prodLine.departments[i].teamMembers[1].getTeamsMultiAt(0)}%',
////                            style: kDeptUpgradeStyle,
////                          ),
////                          Text('+R%', style: kDeptUpgradeStyle),
////                        ],
////                      )
////                    ],
////                  ),
////                  Row(
////                    children: <Widget>[
////                      Icon(
////                        MdiIcons.fromString('alpha-m-circle'),
////                        size: subIconSize,
////                      ),
////                      Column(
////                        children: <Widget>[
////                          Text(
////                            '+${prodLine.departments[i].teamMembers[2].getTeamsMultiAt(0)}%',
////                            style: kDeptUpgradeStyle,
////                          ),
////                          Text('+R%', style: kDeptUpgradeStyle),
////                        ],
////                      ),
////                      Icon(
////                        MdiIcons.fromString('alpha-m-circle'),
////                        size: subIconSize,
////                      ),
////                      Column(
////                        children: <Widget>[
////                          Text(
////                            '+${prodLine.departments[i].teamMembers[3].getTeamsMultiAt(0)}%',
////                            style: kDeptUpgradeStyle,
////                          ),
////                          Text('+R%', style: kDeptUpgradeStyle),
////                        ],
////                      )
////                    ],
////                  ),
////                ],
////              ),
////            ],
////          ),],
////        ),
////        Column(
////          children: <Widget>[Row(
////            children: <Widget>[
////              Icon(
////                prodLine.research[i].getArchetypeIconData(),
////                size: mainIconSize,
////              ),
////              Wrap(
////                direction: Axis.vertical,
////                children: <Widget>[
////                  RotatedBox(
////                    quarterTurns: 3,
////                    child: Text('Prog Bar'),
////                  )
////                ],
////              ),
////              Column(
////                children: <Widget>[
////                  Row(
////                    children: <Widget>[
////                      Icon(
////                        MdiIcons.fromString('alpha-l-circle'),
////                        size: subIconSize,
////                      ),
////                      Column(
////                        children: <Widget>[
////                          Text(
////                            '+${prodLine.research[i].teamMembers[0].getTeamsMultiAt(0)}%',
////                            style: kDeptUpgradeStyle,
////                          ),
////                          Text('+R%', style: kDeptUpgradeStyle),
////                        ],
////                      ),
////                      Icon(
////                        MdiIcons.fromString('alpha-m-circle'),
////                        size: subIconSize,
////                      ),
////                      Column(
////                        children: <Widget>[
////                          Text(
////                            '+${prodLine.research[i].teamMembers[1].getTeamsMultiAt(0)}%',
////                            style: kDeptUpgradeStyle,
////                          ),
////                          Text('+R%', style: kDeptUpgradeStyle),
////                        ],
////                      )
////                    ],
////                  ),
////                  Row(
////                    children: <Widget>[
////                      Icon(
////                        MdiIcons.fromString('alpha-m-circle'),
////                        size: subIconSize,
////                      ),
////                      Column(
////                        children: <Widget>[
////                          Text(
////                            '+${prodLine.research[i].teamMembers[2].getTeamsMultiAt(0)}%',
////                            style: kDeptUpgradeStyle,
////                          ),
////                          Text('+R%', style: kDeptUpgradeStyle),
////                        ],
////                      ),
////                      Icon(
////                        MdiIcons.fromString('alpha-m-circle'),
////                        size: subIconSize,
////                      ),
////                      Column(
////                        children: <Widget>[
////                          Text(
////                            '+${prodLine.research[i].teamMembers[3].getTeamsMultiAt(0)}%',
////                            style: kDeptUpgradeStyle,
////                          ),
////                          Text('+R%', style: kDeptUpgradeStyle),
////                        ],
////                      )
////                    ],
////                  ),
////                ],
////              ),
////            ],
////          ),],
////        ),
//      ],
//    ));
//    if (i < 2) {
//      list.add(Divider());
//    }
//  }
//  return Column(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: list);
//}
