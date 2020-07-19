import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/facility-manager.dart';
import 'package:shop_app/screens/facility/facility-display/components/department_selector.dart';
import 'package:shop_app/screens/facility/facility-display/components/subDepartment_selector.dart';


class StatsPanel extends StatefulWidget {
  StatsPanel({ Key key }) : super(key: key);

  @override
  _StatsPanelState createState() => _StatsPanelState();
}

class _StatsPanelState extends State<StatsPanel> {

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
                    width: 5,
                    color: Provider.of<FacilityManager>(context)
                        .facilities[Provider.of<FacilityManager>(context).getCurrentFacilityIndex()]
                        .getBackgroundColor(),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    DepartmentSelector(),
                    Divider(),
                    SubDepartmentSelector(),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Text('Stats and stuff go down here'),
      ],
    );
  }
}
