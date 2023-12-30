import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {

  CustomCardWidget({required this.mColor, required this.childView, required this.onPress});

  final Color mColor;
  final Widget childView;
  final VoidCallback onPress;
  double margin = 8.0;

  void setMargin(double mar){
    this.margin = mar;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(margin),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: childView),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: mColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(
                  0, 4), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}