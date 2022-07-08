import 'package:flutter/material.dart';
import 'package:food_delivery/Widgets/welcome_text.dart';

class ReusableButton extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color bgcolor;
  double size;
  bool? isIcon;
  final Color borderColor;

  ReusableButton({
    Key? key,
    required this.color,
    this.text,
    this.isIcon = false,
    this.icon,
    required this.bgcolor,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: bgcolor),
          child: isIcon==false ? 
          Center(child: WText(text: text!,color: color,)) : 
          Center(child: Icon(icon,color: color,)),
    );
  }
}
