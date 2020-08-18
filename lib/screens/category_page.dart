import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text("Category Name"),
            leading: Icon(Icons.category),
            trailing: Icon(Icons.chevron_right),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
