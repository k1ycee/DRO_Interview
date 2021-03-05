import 'package:flutter/material.dart';

PreferredSizeWidget appBar({String? title, List<Widget>? actions, Widget? leading}){
  return AppBar(
    title: Text(title!,),
    centerTitle: true,
    actions: actions,
    leading: leading,
  );
}