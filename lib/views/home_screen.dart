import 'package:dro/utils/colors.dart';
import 'package:dro/utils/strings.dart';
import 'package:dro/widgets/app_bar.dart';
import 'package:dro/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SlidingUpPanel(
          minHeight: 60,
          maxHeight: 725,
          color: darkPurple,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          panel: Container(
            height: 200,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ImageIcon(
                      AssetImage("bag.png"),
                      color: white,
                    ),
                    Text(
                      "Bag",
                      style: TextStyle(
                          fontFamily: AppStrings.altLight, fontSize: 15),
                    ),
                  ],
                ),
                Container(
                  height: 10,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: white
                  ),
                ),
                
              ],
            ),
          ),
          body: Scaffold(
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
            body: Column(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_body() {
  return Column(
    children: [],
  );
}

_searchBody() {
  return Column(children: []);
}
