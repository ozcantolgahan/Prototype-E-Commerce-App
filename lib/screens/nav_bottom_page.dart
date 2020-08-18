import 'package:flutter/material.dart';
import 'package:phone_market/model/advertisement.dart';
import 'package:phone_market/model/tab_item.dart';
import 'package:phone_market/screens/category_page.dart';
import 'package:phone_market/screens/homepage.dart';
import 'package:phone_market/screens/profile_page.dart';
import 'package:phone_market/screens/search_page.dart';
import 'package:phone_market/viewmodel/data_view_model.dart';
import 'package:phone_market/widgets/my_bottom_nav.dart';
import 'package:provider/provider.dart';

class NavBottomPage extends StatefulWidget {
  @override
  _NavBottomPageState createState() => _NavBottomPageState();
}

class _NavBottomPageState extends State<NavBottomPage> {
  TabItem _tabItem = TabItem.HomePage;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.HomePage: GlobalKey<NavigatorState>(),
    TabItem.Search: GlobalKey<NavigatorState>(),
    TabItem.Category: GlobalKey<NavigatorState>(),
    TabItem.Profile: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, Widget> allPages() {
    return {
      TabItem.HomePage: HomePage(),
      TabItem.Search: SearchPage(),
      TabItem.Category: CategoryPage(),
      TabItem.Profile: ProfilePage()
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_tabItem].currentState.maybePop(),
      child: MyBottomNavigation(
        navigatorKey: navigatorKeys,
        buildPage: allPages(),
        tabItem: _tabItem,
        onSelectedTab: (selectedTab) {
          debugPrint("secilen tab" + selectedTab.toString());
          if (selectedTab == _tabItem) {
            navigatorKeys[selectedTab]
                .currentState
                .popUntil((route) => route.isFirst);
          } else {
            setState(() {
              _tabItem = selectedTab;
            });
          }
        },
      ),
    );
  }
}
