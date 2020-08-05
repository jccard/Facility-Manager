import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/common_components/container_with_border.dart';
import 'package:shop_app/screens/facility/production_line/display.dart';
import 'package:shop_app/models/ProdLine.dart';


class StatsPanel extends StatefulWidget {
  final ProdLine prodLine;
  const StatsPanel({
    Key key,
    this.prodLine,
  }) : super(key: key);

  @override
  _StatsPanelState createState() => _StatsPanelState();
}

class _StatsPanelState extends State<StatsPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
//        ContainerWithBorder(
//          borderColor: Colors.blue,
//          content: Text('Was Department Selector')
//        ),
//        SizedBox(
//          height: kDefaultPaddin/2,
//        ),
        Expanded(
          child: ContainerWithBorder(
            borderColor: Colors.blue,
            content: Display(prodLine: widget.prodLine),
          ),
        ),
      ],
    );
  }
}
