import 'package:flutter/material.dart';
import 'package:food_delivery/Widgets/welcome_text.dart';

class NextButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  NextButton({
    Key? key,
    this.isResponsive = false,
    this.width = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 222, 88, 184),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: WText(
                      weight: FontWeight.w500,
                      size: 18,
                      text: "Book Trip now",
                      color: Colors.white,
                    ))
                : Container(),
            // Image.asset('Images/next_button.jpg'),
            Image.asset("Images/next-icon.png"),
          ],
        ),
      ),
    );
  }
}
