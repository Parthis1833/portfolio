import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar(
      {required this.controller, required this.tabs});

  final TabController controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabBarScaling = screenWidth > 1400
        ? 0.30
        : screenWidth > 1100
        ? 0.5
        : 0.6;
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.05),
      child: Container(
        width: screenWidth * tabBarScaling,
        child: Theme(
          data: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            controller: controller,
            indicatorColor: Color.fromARGB(202, 191, 0, 220),
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}

