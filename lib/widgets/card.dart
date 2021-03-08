import 'package:dro/utils/colors.dart';
import 'package:dro/utils/margins.dart';
import 'package:dro/utils/strings.dart';
import 'package:flutter/material.dart';

Widget card(
    {required String image,
    required String drugName,
    required String drugContent,
    required String drugForm,
    required String mass,
    required int price}) {
  return Card(
    child: Container(
      height: 500,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              scale: 3.0,
            ),
            verticalSpaceSpecial,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  drugName,
                  style:
                      TextStyle(fontFamily: AppStrings.altBold, fontSize: 11),
                ),
                // verticalSpaceTiny,
                Text(
                  drugContent,
                  style:
                      TextStyle(fontFamily: AppStrings.altThin, fontSize: 11),
                ),
                // verticalSpaceTiny,
                Text(
                  "$drugForm - $mass",
                  style:
                      TextStyle(fontFamily: AppStrings.altThin, fontSize: 12),
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 18,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: grey),
                      child: Center(
                          child: Text(
                              "${AppStrings.nairaSymbol} $price")),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
