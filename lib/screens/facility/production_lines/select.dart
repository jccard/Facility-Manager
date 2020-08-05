/*
what it does:
- display the grid of Facilities
- use the Hero functionality to display the
, Details Page when selecting a Facility
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';

import 'package:shop_app/screens/facility/production_lines/components/body.dart';
import 'package:shop_app/services/facility-manager.dart';

class Select extends StatelessWidget {
  const Select({Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(context) {
    //TODO : change up these iconButtons
    return AppBar(
      elevation: 0,
      title: Text('id_01.name :: \$\$ ${Provider.of<FacilityManager>(context).displayFacilityCurrentCash()}'),
      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.volume_up),
//          tooltip: 'Increase volume by 10',
//          onPressed: () {},
//        ),
//        IconButton(
//          icon: SvgPicture.asset(
//            "assets/icons/search.svg",
//            // By default our  icon color is white
//            color: kTextColor,
//          ),
//          onPressed: () {},
//        ),
//        IconButton(
//          icon: SvgPicture.asset(
//            "assets/icons/cart.svg",
//            // By default our  icon color is white
//            color: kTextColor,
//          ),
//          onPressed: () {},
//        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}