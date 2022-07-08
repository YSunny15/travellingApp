import 'package:flutter/material.dart';
import 'package:food_delivery/Widgets/large_text.dart';
import 'package:food_delivery/Widgets/next_button.dart';
import 'package:food_delivery/Widgets/select_people.dart';
import 'package:food_delivery/Widgets/welcome_text.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int rated = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //We are wrapping stack with container to get height and width
        //And to remove error
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height,
        // height: double.maxFinite,
        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 375,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Images/mountain0.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 68,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu_rounded),
              color: Colors.white,
            ),
          ),
          Positioned(
            right: 8,
            top: 68,
            child: IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: const Icon(Icons.person_pin),
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 320,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LargeText(
                            text: "Mt. Amanora",
                            color: Colors.black87,
                            weight: FontWeight.w500,
                          ),
                          LargeText(
                            text: "Rs 12k",
                            weight: FontWeight.w600,
                            color: Color.fromARGB(209, 81, 44, 174),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color.fromARGB(242, 168, 17, 232),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          WText(
                            text: "IND, Himachal Pradesh",
                            color: Color.fromARGB(242, 168, 17, 232),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star_rate,
                                color: index < rated
                                    ? Colors.yellow
                                    : Colors.blueGrey);
                          }),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        WText(
                          text: '(4.0)',
                          color: Colors.blueGrey,
                        )
                      ]),
                      const SizedBox(
                        width: 25,
                      ),
                      LargeText(
                        text: "People",
                        size: 20,
                        color: Colors.black87,
                        weight: FontWeight.w500,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      WText(
                        text: 'No. of people in your group',
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              child: ReusableButton(
                                  color: selectedIndex == index
                                      ? Colors.blueGrey
                                      : Colors.black,
                                  bgcolor: selectedIndex == index
                                      ? Color.fromARGB(255, 94, 235, 219)
                                      : Colors.purpleAccent,
                                  size: 50,
                                  text: (index + 1).toString(),
                                  borderColor: selectedIndex == index
                                      ? Color.fromARGB(255, 94, 235, 219)
                                      : Colors.purpleAccent),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.75),
                        size: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      WText(
                        text:
                            "Going up and down hills gets the heart pumping, creating a great cardio workout. Like most cardio exercises, hiking helps reduce your risk of heart disease, stroke, high blood pressure, high cholesterol and even some cancers. Hiking is a weight-bearing exercise, which builds muscle mass and helps prevent osteoporosis.",
                        color: Color.fromARGB(255, 127, 125, 125),
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              children: [
                ReusableButton(
                    isIcon: true,
                    icon: Icons.favorite_border_rounded,
                    color: Color.fromARGB(255, 222, 135, 237),
                    bgcolor: Colors.white,
                    size: 60,
                    borderColor: Color.fromARGB(255, 222, 135, 237)),
                const SizedBox(
                  width: 20,
                ),
                NextButton(
                  isResponsive: true,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
