import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color = Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 10.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 20.0;

  Widget _buildDot(int pos) {


    int index = pos % itemCount;
    double ss = 0;
    try{
      ss = ((controller.page??0) % itemCount);

    }catch(e){

    }

    double selectedness = Curves.easeOutQuart.transform(
      max(
        0.0,
        1.0 - ((ss) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;

    print('page ${index} pos ${pos} ${selectedness} controller ${controller.page}');

    print('\n\n');
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: controller.page! >=  index ? color:Color(0xFFCECFD1),
          type: MaterialType.card,
          borderRadius: BorderRadius.circular(8),
          child: new Container(
            width: _kDotSize,
            height: _kDotSize,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}