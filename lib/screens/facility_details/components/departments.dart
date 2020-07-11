import 'package:flutter/material.dart';
import 'package:shop_app/models/Facility.dart';

import '../../../constants.dart';

class Departments extends StatelessWidget {
  const Departments({
    Key key,
    @required this.facility,
  }) : super(key: key);

  final Facility facility;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.memory),
                    color: Colors.blueAccent,
                    onPressed: () {
                      // TODO make this button update the next set of buttons under Size
                    }),
                IconButton(
                    icon: Icon(Icons.people),
                    color: Colors.deepOrange,
                    onPressed: () {
                      // TODO make this button update the next set of buttons under Size
                    }),
                IconButton(
                    icon: Icon(Icons.whatshot),
                    color: Colors.redAccent,
                    onPressed: () {
                      // TODO make this button update the next set of buttons under Size
                    })
              ],
            ),
          ),
        ),

      ],
    );
  }
}
