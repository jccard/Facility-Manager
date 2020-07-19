import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../facility/facility-display/components/stats_panel.dart';
import 'package:shop_app/screens/facility/facility-display/components/product_title_with_image.dart';
import 'package:shop_app/constants.dart';

class Body extends StatelessWidget {

  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ProductTitleWithImage(),
        ),
        Expanded(
          flex: 8,
          child: Container(
            padding: EdgeInsets.only(
              top: kDefaultPaddin,
              left: kDefaultPaddin,
              right: kDefaultPaddin,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: StatsPanel(),
          ),
        ),
      ],
    );
  }
}
