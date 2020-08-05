import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';

import 'package:shop_app/services/facility-manager.dart';

import 'package:shop_app/screens/facility/display/screen-facility-display.dart';
import 'package:shop_app/screens/facility/production_line/display.dart';
import 'package:shop_app/screens/facility/production_lines/components/item-card.dart';

class Body extends StatelessWidget {
  const Body({ Key key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: SizedBox(height: kDefaultPaddin),
            //child: Categories(),
            //child: Text('not sure what to do with this yet'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount:
                  Provider.of<FacilityManager>(context).getProdLinesCount(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) => ItemCard(
                bgColor: Provider.of<FacilityManager>(context).getProdLineBackgroundColorAt(index),
                header: Provider.of<FacilityManager>(context).getProdLineNameAt(index),
                id: Provider.of<FacilityManager>(context).getProdLineIdAt(index),
                imagePath: Provider.of<FacilityManager>(context).getProdLineImagePathAt(index),
                press: () {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenFacilityDisplay(
                        prodLine: Provider.of<FacilityManager>(context).getProdLineAt(index),
                      ),
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
