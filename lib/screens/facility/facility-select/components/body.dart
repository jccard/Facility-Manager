import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';

import 'package:shop_app/facility-manager.dart';

import 'package:shop_app/screens/facility/facility-display/screen-facility-display.dart';
import 'package:shop_app/screens/facility/facility-select/components/item-card.dart';

class Body extends StatelessWidget {
  const Body({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            //child: Categories(),
            child: Text('Categories() goes here'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount:
                  Provider.of<FacilityManager>(context).getFacilityCount(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) => ItemCard(
                press: () {
                  Provider.of<FacilityManager>(context, listen: false).updateCurrentFacilityIndex(index);
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenFacilityDisplay(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
