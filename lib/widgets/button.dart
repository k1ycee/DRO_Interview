import 'package:dro/utils/colors.dart';
import 'package:dro/utils/strings.dart';
import 'package:flutter/material.dart';

Widget button(
    {VoidCallback? onTapped,
    String? image,
    String? text,
    Color buttonColor = droPurple,
    double height = 45,
    double width = 250}) {
  return GestureDetector(
    onTap: onTapped,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 70),
      height: height,
      width: width,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: grey, blurRadius: 2.0)],
          color: buttonColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageIcon(
            AssetImage(image!),
            color: white,
          ),
          Text(
            text!,
            style: TextStyle(
                fontFamily: AppStrings.regular, fontSize: 14, color: white),
          )
        ],
      ),
    ),
  );
}

Widget dialogButton(
    {VoidCallback? onTapped,
    String? image,
    String? text,
    Color buttonColor = droPurple,
    double height = 45,
    double width = 250}) {
  return GestureDetector(
    onTap: onTapped,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 70),
      height: height,
      width: width,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: grey, blurRadius: 2.0)],
          color: buttonColor,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
              fontFamily: AppStrings.regular, fontSize: 14, color: white),
        ),
      ),
    ),
  );
}
