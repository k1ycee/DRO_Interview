import 'package:dro/utils/colors.dart';
import 'package:dro/widgets/app_bar.dart';
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
          icon: ImageIcon(AssetImage('images/arrow.png',), color: black, size: 15,),
          onPressed: () {},
        ),
      ),
    );
  }
}
