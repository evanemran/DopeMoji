import 'package:dope_moji/modules/create_avatar/widgets/create_avatar_widget.dart';
import 'package:flutter/cupertino.dart';

enum HomeMenu {

  createAvatar('Create Avatar', 'assets/images/add_image.png', CreateAvatar()),
  editAvatar('Create Avatar', 'assets/images/add_image.png', CreateAvatar()),
  createGif('Create Avatar', 'assets/images/add_image.png', CreateAvatar()),
  createCaricature('Create Avatar', 'assets/images/add_image.png', CreateAvatar()),
  getInfo('Create Avatar', 'assets/images/add_image.png', CreateAvatar());

  final String title;
  final String icon;
  final Widget widget;

  const HomeMenu(this.title, this.icon, this.widget);
}