import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../styles/text_style.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  final GlobalKey<_AppBarWidgetState> appBar_key = GlobalKey<_AppBarWidgetState>();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: appBar_key,
      flexibleSpace: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/purple_pattern.png"),
                  fit: BoxFit.cover
              )
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/purple_pattern.png", height: 36, fit: BoxFit.fitHeight,),
                  const Text("", style: AppText.appbarTagText,),
                ],
              ),)
          ),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(top: 0.0, right: 12.0),
          child: Icon(Icons.notification_important_outlined, color: Colors.white,),
          /*child: Image.asset('assets/ic_notification.png', height: 26, width: 26, fit: BoxFit.fitWidth,),*/
        )
      ],
    );
  }
}
