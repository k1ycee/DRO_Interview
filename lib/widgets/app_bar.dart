import 'package:flutter/material.dart';

PreferredSizeWidget appBar({Text? title, List<Widget>? actions, Widget? leading}){
  return AppBar(
    title: title,
    centerTitle: true,
    actions: actions,
    leading: leading,
    
  );
}