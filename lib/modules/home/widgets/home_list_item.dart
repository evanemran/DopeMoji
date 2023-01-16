import 'package:dope_moji/modules/home/enums/home_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeListItem extends StatefulWidget {
  const HomeListItem({Key? key, required this.item}) : super(key: key);

  final HomeMenu item;

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.item.widget),
        );
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.item.icon),
              fit: BoxFit.fitWidth,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Center(
            child: Text(widget.item.title),
          ),
        ),
      ),
    );
  }
}
