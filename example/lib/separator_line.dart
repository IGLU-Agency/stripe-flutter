import 'package:flutter/material.dart';

class SeparatorLine extends StatelessWidget {
  final EdgeInsets? margin;
  final Color? backgroundColor;

  const SeparatorLine({
    this.margin,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      child: Container(
        height: 1.0,
        color: Theme.of(context).dividerColor,
        margin: margin ?? EdgeInsets.fromLTRB(16, 0, 0, 0),
      ),
      color: this.backgroundColor != null
          ? this.backgroundColor
          : Theme.of(context).backgroundColor,
    );
  }
}
