/*
what it does:
- display the grid of Facilities
- use the Hero functionality to display the
, Details Page when selecting a Facility
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';

import 'package:shop_app/screens/facility/facility-select/components/body.dart';

class ScreenFacilitySelect extends StatelessWidget {
  const ScreenFacilitySelect({Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text('Title Text'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.volume_up),
          tooltip: 'Increase volume by 10',
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}