import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/services/facility-manager.dart';

import 'package:shop_app/constants.dart';

import 'package:shop_app/models/ProdLine.dart';


class ProductTitleWithImage extends StatelessWidget {
  final ProdLine prodLine;
  const ProductTitleWithImage({
    Key key,
    this.prodLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Facility Category",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                prodLine.getName(),
                style: kSubDeptCardDisplayName,
              ),
              Text(
                prodLine.getLongDescription(),
              ),
            ],
          ),
        ),
        SizedBox(height: kDefaultPaddin),
        Flexible(
          flex: 2,
          child: Hero(
            tag: prodLine.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                prodLine.getImagePath(),
                scale: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
