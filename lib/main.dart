import 'package:dro/locator.dart';
import 'package:dro/views/home_screen.dart';
import 'package:dro/vm/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: HomeScreen(),
      ),
    );
  }
}
