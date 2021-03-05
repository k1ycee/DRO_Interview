import 'package:dro/utils/colors.dart';
import 'package:dro/utils/strings.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(
    {String? title, List<Widget>? actions, Widget? leading}) {
  return AppBar(
    title: Text(
      title!,
      style: TextStyle(fontFamily: AppStrings.regular, color: black),
    ),
    centerTitle: true,
    actions: actions,
    leading: leading,
    elevation: 0,
    backgroundColor: white,
  );
}
