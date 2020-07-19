import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/facility-manager.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class DepartmentSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Widget> iconButtons = [];

    Map<int, String> iconString = {0:'alarm', 1:'memory', 2:'sword'};

    for (int i = 0; i < 2; i++) {
      iconButtons.add(
        IconButton(
          icon: Icon(MdiIcons.fromString(iconString[i])),
          color: (Provider.of<FacilityManager>(context)
              .getCurrentDepartmentIndex() == i)
              ? Colors.blueAccent
              : Colors.grey,
          onPressed: () {
            Provider.of<FacilityManager>(context, listen: false)
                .updateCurrentDepartmentIndex(i);
          }
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: iconButtons,
    );
  }
}
