import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/facility-manager.dart';

import 'package:shop_app/constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Facility Category",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    Provider.of<FacilityManager>(context)
                        .facilities[Provider.of<FacilityManager>(context)
                            .getCurrentFacilityIndex()]
                        .name,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Provider.of<FacilityManager>(context)
                        .facilities[Provider.of<FacilityManager>(context)
                            .getCurrentFacilityIndex()]
                        .getLongDescription(),
                  ),
                ],
              ),
            ),
            SizedBox(height: kDefaultPaddin),
            Flexible(
              flex: 2,
              child: Hero(
                tag: Provider.of<FacilityManager>(context)
                    .facilities[Provider.of<FacilityManager>(context)
                        .getCurrentFacilityIndex()]
                    .id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    Provider.of<FacilityManager>(context)
                        .facilities[Provider.of<FacilityManager>(context)
                            .getCurrentFacilityIndex()]
                        .getImage(),
                    scale: 2.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
