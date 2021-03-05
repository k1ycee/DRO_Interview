import 'package:dro/utils/colors.dart';
import 'package:dro/widgets/app_bar.dart';
import 'package:dro/widgets/icon_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appBar(
        title: "125 items",
        leading: IconButton(
          icon: ImageIcon(
            AssetImage(
              'images/arrow.png',
            ),
            color: black,
            size: 15,
          ),
          onPressed: () {},
        ),
      ),
      body: _body(context),
    );
  }
}

_body(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconButton(
              icon: ImageIcon(
                AssetImage("images/updown.png"),
                size: 20,
              ),
              onPressed: () {},
            ),
            Spacer(),
            iconButton(
                icon: ImageIcon(
                  AssetImage("images/filter.png"),
                  size: 20,
                ),
                onPressed: () {}),
            Spacer(),
            iconButton(
              icon: Icon(
                Icons.search,
                size: 20,
              ),
              onPressed: () {},
            ),
          ],
        ),
      )
    ],
  );
}
