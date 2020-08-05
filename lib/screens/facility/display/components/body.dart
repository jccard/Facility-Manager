import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../../../facility/display/components/stats_panel.dart';
import 'package:shop_app/screens/facility/display/components/product_title_with_image.dart';

import 'package:shop_app/models/ProdLine.dart';


class Body extends StatelessWidget {
  final ProdLine prodLine;
  Body({
    Key key,
    this.prodLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 115,
          child: ProductTitleWithImage(prodLine: prodLine),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(kDefaultPaddin/2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: StatsPanel(prodLine: prodLine),
          ),
        ),
      ],
    );
  }
}
