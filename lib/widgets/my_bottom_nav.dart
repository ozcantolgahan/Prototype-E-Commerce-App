import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_market/model/tab_item.dart';

class MyBottomNavigation extends StatelessWidget {
  final TabItem tabItem;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> buildPage;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKey;

  const MyBottomNavigation(
      {Key key, this.tabItem, this.onSelectedTab, this.buildPage, this.navigatorKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            _navItem(TabItem.HomePage),
            _navItem(TabItem.Search),
            _navItem(TabItem.Category),
            _navItem(TabItem.Profile),
          ],
          onTap: (index) => onSelectedTab(TabItem.values[index]),
        ),
        tabBuilder: (context, index) {
          final pageItem = TabItem.values[index];
          return CupertinoTabView(
              navigatorKey: navigatorKey[pageItem], builder: (context) {
            return buildPage[pageItem];
          });
        });
  }

  BottomNavigationBarItem _navItem(TabItem tabItem) {
    final currentTab = TabItemModel.allTabs[tabItem];
    return BottomNavigationBarItem(
        title: Text(currentTab.title), icon: Icon(currentTab.icon));
  }
}
