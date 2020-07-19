import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/facility-manager.dart';

class ItemCard extends StatelessWidget {
  final Function press;
  const ItemCard({ Key key, this.press }) : super(key: key);

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
              color: Provider.of<FacilityManager>(context)
                  .facilities[Provider.of<FacilityManager>(context).getCurrentFacilityIndex()]
                  .getBackgroundColor(),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  Provider.of<FacilityManager>(context)
                      .facilities[Provider.of<FacilityManager>(context).getCurrentFacilityIndex()]
                      .getName(),
                ),
                SizedBox(height: 10.0,),
                Hero(
                  tag: Provider.of<FacilityManager>(context)
                          .facilities[Provider.of<FacilityManager>(context).getCurrentFacilityIndex()]
                          .id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      Provider.of<FacilityManager>(context)
                          .facilities[Provider.of<FacilityManager>(context).getCurrentFacilityIndex()]
                          .getImage(),
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
