/*
I ran into a real problem with the sizing requirements for the ListView.
I had it working at one point, but didn't commit, so I lost it.

I ended up rebuilding the body component (this file).
 I simplified the approach by using Containers with height values based on the
 height of the screen using media query.

After I get the formatting set up, I can use the Container's decoration property.
 */
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
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.2),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
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
                  //column lets the white box stretch to the bottom of the screen
                  child: Column(
                    children: <Widget>[
                      //row lets the white box stretch to the sides of the screen
                      Row(
                        children: <Widget>[
                          //Text('some text, because StatsPanel is not working yet.'),
                          StatsPanel(facility: facility),
                        ],
                      ),
                      //StatsPanel(facility: facility),
                    ],
                  ),
                ),
                ProductTitleWithImage(facility: facility),
              ],
            ),
          )
        ],
      ),
    );
  }
}
