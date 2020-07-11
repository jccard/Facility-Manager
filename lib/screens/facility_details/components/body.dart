import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Facility.dart';

import 'stats_panel.dart';
import 'product_title_with_image.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  final Facility facility;

  const Body({Key key, this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ProductTitleWithImage(facility: facility),
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
            child: StatsPanel(facility: facility),
          ),
        ),
      ],
    );
  }
}
