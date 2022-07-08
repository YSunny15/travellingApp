import 'package:flutter/material.dart';
import 'package:food_delivery/Widgets/large_text.dart';
import 'package:food_delivery/Widgets/next_button.dart';
import 'package:food_delivery/Widgets/welcome_text.dart';
import 'package:food_delivery/pages/mainpage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  static final Color w1 = Color.fromARGB(255, 254, 243, 242);
  static final Color w2 = Color.fromARGB(255, 254, 255, 254);
  static final Color w3 = Colors.transparent;
  static final Color bbg = const Color.fromARGB(255, 223, 199, 205);

  List images = [
    "welcome2.jpg",
    "welcome1.jpg",
    "welcome3.png",
  ];

  List colors = [w1, w2, w3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: colors[index],
                image: DecorationImage(
                    image: AssetImage("Images/" + images[index]),
                    fit: BoxFit.contain),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 160, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LargeText(weight: FontWeight.w500, text: 'Trips'),
                        const SizedBox(
                          height: 400,
                        ),
                        WText(
                          text:
                              ' "It feels good to be lost in the right direction"',
                          size: 17,
                        ),
                        const SizedBox(
                          height: 40,
                        ),

                        //Button is here -->
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                          },
                          child: NextButton(
                            width: 100,
                          ),
                        )
                      ],
                    ),

                    // To put dots on right side during welcome page
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsetsDirectional.only(bottom: 3),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:
                                index == indexDots ? bbg : bbg.withOpacity(0.4),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

// class AppColors {
  // static final Color w1 = Color.fromARGB(255, 254, 243, 242);
  // static final Color w2 = Color.fromARGB(255, 254, 255, 254);
// }
