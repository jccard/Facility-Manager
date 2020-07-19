import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/facility-manager.dart';


class SubDepartmentSelector extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<Widget> iconButtons = [];

    for (int i = 0; i < 2; i++) {
      iconButtons.add(
        IconButton(
          icon: Provider.of<FacilityManager>(context)
            .getSubDepartmentIconAtIndex(i),
          color: (Provider.of<FacilityManager>(context)
              .getCurrentSubDepartmentIndex() == i)
              ? Colors.blueAccent
              : Colors.grey,
          onPressed: () {
            Provider.of<FacilityManager>(context, listen: false)
                .updateCurrentSubDepartmentIndex(i);
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