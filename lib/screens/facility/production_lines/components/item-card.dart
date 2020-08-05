import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/services/facility-manager.dart';

class ItemCard extends StatelessWidget {
  final Function press;
  final Color bgColor;
  final String header;
  final int id;
  final String imagePath;
  const ItemCard({
    Key key,
    this.press,
    this.bgColor,
    this.header,
    this.id,
    this.imagePath,
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
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(header),
                SizedBox(height: 10.0,),
                Hero(
                  tag: id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(imagePath),
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
