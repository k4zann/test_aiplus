import 'package:flutter/material.dart';

class RowBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final int itemCount;
  final bool? isReverse;

  const RowBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.verticalDirection = VerticalDirection.down,
    this.isReverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      verticalDirection: verticalDirection,
      children: isReverse!
          ? List.generate(
              itemCount,
              (index) => itemBuilder(context, index),
              growable: false,
            ).toList().reversed.toList()
          : List.generate(
              itemCount,
              (index) => itemBuilder(context, index),
              growable: false,
            ).toList(),
    );
  }
}