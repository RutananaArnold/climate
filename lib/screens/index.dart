import 'package:agriculture_app/screens/facts_page.dart';
import 'package:agriculture_app/screens/profile/exporter.dart';
import 'package:agriculture_app/screens/weatherForecast/weatherui.dart';
import 'package:flutter/material.dart';
import 'package:agriculture_app/components/palette.dart';
import 'package:agriculture_app/components/bottombar_item.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int activeTab = 0;
  List<IconData> tapIcons = [
    Icons.waterfall_chart,
    Icons.map_outlined,
    // Icons.fact_check_outlined,
    Icons.person_rounded
  ];
  List<Widget> pages = [
    Climate(),
    FactsPage(),
    // Container(),
    UserInfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return goHome();
  }

  goHome() {
    return Scaffold(
        backgroundColor: appBgColor,
        bottomNavigationBar: getBottomBar(),
        body: getBarPage());
  }

  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: .5,
                spreadRadius: .5,
                offset: const Offset(0, 1))
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              tapIcons.length,
              (index) => BottomBarItem(
                    tapIcons[index],
                    "",
                    isActive: activeTab == index,
                    activeColor: primary,
                    onTap: () {
                      setState(() {
                        activeTab = index;
                      });
                    },
                  ))),
    );
  }

  Widget getBarPage() {
    return IndexedStack(
        index: activeTab,
        children: List.generate(tapIcons.length, (index) => pages[index]));
  }
}
