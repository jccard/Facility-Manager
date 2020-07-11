import 'package:flutter/material.dart';
import 'package:shop_app/models/Gadget.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.gadget,
  }) : super(key: key);

  final Gadget gadget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        gadget.longDescription,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
