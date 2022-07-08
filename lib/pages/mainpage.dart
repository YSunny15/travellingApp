import 'package:flutter/material.dart';

import 'nav_pages/bar_item_page.dart';
import 'nav_pages/homepage.dart';
import 'nav_pages/mypage.dart';
import 'nav_pages/searchpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Pages according to index in bottom nav bar
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  //Fun to set index
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          // To remove error on clicking
          selectedFontSize: 0,
          unselectedFontSize: 0,

          // You cannot change bg color until you change type to fixed from default shifting
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          //
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.deepOrangeAccent,

          //To remove unnecessory error caused due to to labels
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          unselectedItemColor: Colors.grey.withOpacity(0.4),
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.apps)),
            BottomNavigationBarItem(label: 'Bar', icon: Icon(Icons.bar_chart)),
            BottomNavigationBarItem(
                label: 'Search', icon: Icon(Icons.search_rounded)),
            BottomNavigationBarItem(label: 'MY', icon: Icon(Icons.person))
          ]),
      body: pages[currentIndex],
    );
  }
}
