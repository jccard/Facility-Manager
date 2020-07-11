import 'package:flutter/material.dart';
import 'package:shop_app/models/Facility.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.facility,
  }) : super(key: key);

  final Facility facility;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Facility Category",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  facility.displayName,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  facility.longDescription,
                ),
              ],
            ),
            SizedBox(height: kDefaultPaddin),
            Hero(
              tag: "${facility.id}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(
                  facility.displayImage,
                  scale: 2.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
