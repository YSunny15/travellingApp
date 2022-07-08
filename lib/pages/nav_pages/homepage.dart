import 'package:flutter/material.dart';

import 'package:food_delivery/Widgets/large_text.dart';
import 'package:food_delivery/pages/info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // To get bottom images for main page
  var images = {
    "diving.png": "Diving",
    "gliding.png": "Gliding",
    "hiking.png": "Hiking",
    "skiing.png": "Skiing",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    //Tabbar should be implemented within TickerProvider and under *context ^
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //menu text
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            child: Row(children: [
              const Icon(
                Icons.menu_rounded,
                size: 30,
                color: Colors.black54,
              ),
              Expanded(child: Container()),
              Stack(children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purpleAccent.withOpacity(0.7)),
                ),
                Positioned(
                  bottom: -2,
                  right: 6,
                  child: IconButton(
                    splashColor: Colors.blue,
                    iconSize: 25,
                    onPressed: () {},
                    icon: const Icon(Icons.person_outline_sharp),
                    color: Colors.white,
                  ),
                ),
              ]),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          //Discover Text
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: LargeText(
                text: "Discover !!",
                weight: FontWeight.w800,
              )),
          const SizedBox(
            height: 10,
          ),
          //Tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 25, right: 25),
                  controller: tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.blueGrey,
                  isScrollable: true,
                  //Build customized class becoz it does not take boxdecoration it takes decoration
                  indicator: CircleTabindicator(
                      color: Colors.purpleAccent, radius: 4.0),
                  tabs: const [
                    Tab(text: 'Places'),
                    Tab(text: 'Inspiration'),
                    Tab(text: 'Emotions')
                  ]),
            ),
          ),
          //Tabbar View
          Container(
            height: 300,
            padding: const EdgeInsets.only(left: 20),
            width: double.maxFinite,
            child: TabBarView(controller: tabController, children: [
              ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const InfoPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('Images/mountain$index.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  }),
              Center(
                  child: const Text(
                'Google kr le bhai',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              Center(
                  child: const Text(
                'Paisa lgta h ghumne ke liye bhi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          //Explore more text
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LargeText(text: "Explore more", size: 21),
                const Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 35),
                    child: Column(children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage(
                                  "Icons/" + images.keys.elementAt(index)),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          images.values.elementAt(index),
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    ]),
                  );
                }),
          )
        ]),
      ),
    );
  }
}

// For the circle below tab
class CircleTabindicator extends Decoration {
  final Color color;
  double radius;
  CircleTabindicator({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
