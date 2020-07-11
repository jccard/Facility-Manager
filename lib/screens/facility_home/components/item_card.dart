import 'package:flutter/material.dart';
import 'package:shop_app/models/Facility.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Facility facility;
  final Function press;
  const ItemCard({
    Key key,
    this.facility,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            padding: EdgeInsets.all(kDefaultPaddin),
            decoration: BoxDecoration(
              color: facility.displayBackgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  // products is out demo list
                  facility.displayName,
                  style: kItemCardTextStyle,
                ),
                SizedBox(height: 10.0,),
                Hero(
                  tag: "${facility.id}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      facility.displayImage,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
