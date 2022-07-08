import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeText extends StatelessWidget {
  double size;
  final String text;
  final FontWeight weight;
  final Color color;
  LargeText({
    Key? key,
    this.size = 30,
    this.weight = FontWeight.w400,
    required this.text,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: size, 
          fontWeight: weight, 
          color: color),
      // style: TextStyle(
      //   color: color,
      //   fontSize: size,
      //   fontWeight: FontWeight.bold
      // ),
    );
  }
}
