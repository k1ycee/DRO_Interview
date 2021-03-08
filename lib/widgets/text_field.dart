import 'package:flutter/material.dart';

Widget textField(
    {TextEditingController? controller,
    Function? onPressed,
    TextInputAction? action,
    TextInputType? inputType, FocusNode? node, VoidCallback? onCancel}) {
  return Container(
    height: 45,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      focusNode: node,
      controller: controller,
      keyboardType: inputType,
      textInputAction: action,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: onCancel,
        ),
      ),
    ),
  );
}
