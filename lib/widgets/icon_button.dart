import 'package:dro/utils/colors.dart';
import 'package:flutter/material.dart';

Widget iconButton({required Widget icon, VoidCallback? onPressed}) {
  return Container(
    height: 45,
    width: 45,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), color: grey.withOpacity(0.2)),
    child: IconButton(
      icon: icon,
      onPressed: onPressed,
    ),
  );
}
