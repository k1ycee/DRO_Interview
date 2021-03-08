import 'package:dro/utils/colors.dart';
import 'package:flutter/material.dart';

Widget iconButton({required Widget icon, VoidCallback? onPressed}) {
  return Container(
    height: 35,
    width: 35,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), color: grey.withOpacity(0.1)),
    child: IconButton(
      icon: icon,
      onPressed: onPressed,
    ),
  );
}
