import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Facility.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/Employee.dart';
import 'package:shop_app/models/Project.dart';
import '../../../constants.dart';

enum Department { manufacturing, teams, research }

class StatsPanel extends StatefulWidget {
  const StatsPanel({
    Key key,
    @required this.facility,
  }) : super(key: key);

  final Facility facility;

  @override
  _StatsPanelState createState() => _StatsPanelState();
}

class _StatsPanelState extends State<StatsPanel>
    with SingleTickerProviderStateMixin<StatsPanel> {

  Department selectedDepartment = Department.manufacturing;
  Widget displayedSubdepartment = Text('Please select a subdepartment.');

  @override
  Widget build(BuildContext context) {
    //
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.memory),
                            color:
                                (selectedDepartment == Department.manufacturing)
                                    ? Colors.blueAccent
                                    : Colors.grey,
                            onPressed: () {
                              setState(() {
                                selectedDepartment = Department.manufacturing;
                              });
                            }),
                        IconButton(
                            icon: Icon(Icons.people),
                            color: (selectedDepartment == Department.teams)
                                ? Colors.deepOrange
                                : Colors.grey,
                            onPressed: () {
                              setState(() {
                                selectedDepartment = Department.teams;
                              });
                            }),
                        IconButton(
                            icon: Icon(Icons.whatshot),
                            color: (selectedDepartment == Department.research)
                                ? Colors.redAccent
                                : Colors.grey,
                            onPressed: () {
                              setState(() {
                                selectedDepartment = Department.research;
                              });
                            }),
                      ],
                    ),
                    Divider(),
                    rowSubDepartments(widget.facility),
                  ],
                ),
              ),
            ),
          ],
        ),
        Divider(),
        displayedSubdepartment,
      ],
    );
  }

  //region rowDepartmentSubs
  Widget rowSubDepartments(Facility facility) {
    switch (selectedDepartment) {
      case Department.manufacturing:
        return buildManufacturingSubs(facility.manufacturing);
        break;
      case Department.teams:
        return buildTeamsSubs(facility.teams);
        break;
      case Department.research:
        return buildResearchSubs(facility.research);
        break;
    }
    return buildManufacturingSubs(facility.manufacturing);
  }

  Widget buildManufacturingSubs(List<Product> products) {
    List<Widget> deptSubButtons = new List<Widget>();
    products.forEach((it) {
      deptSubButtons.add(new IconButton(
        icon: Image.asset(it.displayImage),
        onPressed: () {
          // TODO this needs to trigger rowSubDepartmentCard()
          /// I need to setSate() here, but what gets set?
          /// This function is called within a setState() call, which iterates over the
          ///  subdepartment values. That is how I'm getting it.displayImage.
          /// It seems like I could call a displaySubdepartment() function from here
          ///  and pass it.id to the class's statsPanelDisplay() function.
          /// Might not even need to pass it.id...
          setState(() {
            displayedSubdepartment = it.statsPanelDisplay();
          });
        },
      ));
    });
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: deptSubButtons,
    );
  }

  Widget buildTeamsSubs(List<Employee> employees) {
    List<Widget> deptSubButtons = new List<Widget>();
    employees.forEach((it) {
      deptSubButtons.add(new IconButton(
        icon: Icon(Icons.person),
        onPressed: () {},
      ));
    });
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: deptSubButtons,
    );
  }

  Widget buildResearchSubs(List<Project> projects) {
    List<Widget> deptSubButtons = new List<Widget>();
    projects.forEach((it) {
      deptSubButtons.add(new IconButton(
        icon: Icon(Icons.insert_chart),
        onPressed: () {},
      ));
    });
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: deptSubButtons,
    );
  }
  //endregion

  //region rowDepartmentSubCard
  Widget rowSubDepartmentCard() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    "assets/images/facilities/Factory_01.png",
                    scale: 3.0,
                  ),
                  SizedBox(width: kDefaultPaddin),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('DISPLAY NAME'),
                      Text('Short description.'),
                    ],
                  ),
                ],
              ),
              Divider(),

              Row(
                children: <Widget>[
                  Text(
                    'Product: ',
                    style: kSubDeptCardStatName,
                  ),
                  Text(
                    'Archetype - Subtype',
                    style: kSubDeptCardStatValue,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Value/Cycle: ',
                    style: kSubDeptCardStatName,
                  ),
                  Text(
                    'base - modified',
                    style: kSubDeptCardStatValue,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Qty/Cycle: ',
                    style: kSubDeptCardStatName,
                  ),
                  Text(
                    'base - modified',
                    style: kSubDeptCardStatValue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
//endregion
}
