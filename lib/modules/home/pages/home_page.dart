import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../enums/home_menu.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/home_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeMenu> hList = [
    HomeMenu.createAvatar,
    HomeMenu.createGif,
    HomeMenu.createGif,
    HomeMenu.editAvatar,
    HomeMenu.getInfo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(160.0),
        child: AppBarWidget(),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: hList.length,
          itemBuilder: (context, position) {
            var item = hList[position];
            return HomeListItem(item: item,);
          }),
    );
  }
}
