import 'package:flutter/material.dart';
import 'package:portfoilio/utils/content_view.dart';
import 'package:portfoilio/utils/view_wrapper.dart';
import 'package:portfoilio/views/about_view.dart';
import 'package:portfoilio/views/home_view.dart';
import 'package:portfoilio/views/projects_view.dart';
import 'package:portfoilio/widgets/bottom_bar.dart';
import 'package:portfoilio/widgets/custom_tab.dart';
import 'package:portfoilio/widgets/custom_tab_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ItemScrollController itemScrollController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double bottomPadding;
  late double sidePadding;

  List<ContentView> contentViews = [
    ContentView(
      tab: CustomTab(title: 'home'),
      content: HomeView(),
    ),
    ContentView(
      tab: CustomTab(title: 'about-me'),
      content: ProjectsView(),
    ),
    ContentView(
      tab: CustomTab(title: 'project'),
      content: AboutView(),
    ),
    ContentView(
      tab: CustomTab(title: 'contect'),
      content: ProjectsView(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    print('Width: $screenWidth');
    print('Height: $screenHeight');
    return Scaffold(
      backgroundColor: Color(0xff1e1e24),
      key: scaffoldKey,
      endDrawer: drawer(),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child:
            ViewWrapper(desktopView: desktopView(), mobileView: mobileView()),
      ),
    );
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: screenHeight * 0.05,
          child: CustomTabBar(
              controller: tabController,
              tabs: contentViews.map((e) => e.tab).toList()),
        ),

        /// Tab Bar View
        BottomBar()
      ],
    );
  }

  Widget mobileView() {
    return Padding(
      padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
      child: Container(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                iconSize: screenWidth * 0.08,
                icon: const Icon(Icons.menu_rounded),
                color: const Color.fromARGB(255, 191, 0, 220),
                splashColor: Colors.transparent,
                onPressed: () => scaffoldKey.currentState?.openEndDrawer()),
            Expanded(
              child: ScrollablePositionedList.builder(
                scrollDirection: Axis.vertical,
                itemScrollController: itemScrollController,
                itemCount: contentViews.length,
                itemBuilder: (context, index) => contentViews[index].content,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Container(
      width: screenWidth * 0.5,
      color: Colors.transparent,
      child: Drawer(
        child: ListView(
          children: [Container(height: screenHeight * 0.05)] +
              contentViews
                  .map((e) => Container(
                        child: ListTile(
                          title: Row(
                            children: [
                              const Text(
                                '#',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 191, 0, 220),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                e.tab.title,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          onTap: () {
                            itemScrollController.scrollTo(
                                index: contentViews.indexOf(e),
                                duration: const Duration(milliseconds: 300));
                            Navigator.pop(context);
                          },
                        ),
                      ))
                  .toList(),
        ),
      ),
    );
  }
}
