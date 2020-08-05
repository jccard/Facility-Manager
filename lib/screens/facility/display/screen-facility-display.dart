import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/services/facility-manager.dart';
import 'package:shop_app/screens/facility/display/components/body.dart';
import 'package:shop_app/models/ProdLine.dart';


class ScreenFacilityDisplay extends StatefulWidget {
  final ProdLine prodLine;
  ScreenFacilityDisplay({
    Key key,
    this.prodLine,
  }) : super(key: key);

  @override
  _ScreenFacilityDisplayState createState() => _ScreenFacilityDisplayState();
}

class _ScreenFacilityDisplayState extends State<ScreenFacilityDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.prodLine.getBgColor(),
      appBar: buildAppBar(context),
      body: Body(prodLine: widget.prodLine),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: widget.prodLine.getBgColor(),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text('\$\$ ${Provider.of<FacilityManager>(context)
          .displayFacilityCurrentCash()}'),
      actions: <Widget>[
//        IconButton(
//          icon: SvgPicture.asset("assets/icons/search.svg"),
//          onPressed: () {},
//        ),
//        IconButton(
//          icon: SvgPicture.asset("assets/icons/cart.svg"),
//          onPressed: () {},
//        ),
//        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}