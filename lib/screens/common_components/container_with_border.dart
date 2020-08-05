import 'package:flutter/material.dart';

class ContainerWithBorder extends StatelessWidget {
  final Color borderColor;
  final Widget content;

  ContainerWithBorder({
    Key key,
    this.borderColor,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: content,
    );
  }
}
