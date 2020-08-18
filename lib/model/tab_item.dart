import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem{HomePage,Search,Category,Profile}

class TabItemModel{
  final String title;
  final IconData icon;

  TabItemModel(this.title, this.icon);
  static Map<TabItem,TabItemModel> allTabs={
    TabItem.HomePage:TabItemModel("HomePage",Icons.home),
    TabItem.Search:TabItemModel("Search",Icons.search),
    TabItem.Category:TabItemModel("Category",Icons.category),
    TabItem.Profile:TabItemModel("Profile",Icons.person)
  };

}