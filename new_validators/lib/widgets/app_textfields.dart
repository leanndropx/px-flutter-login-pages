
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppTextFields extends StatelessWidget {
  AppTextFields({Key? key, required this.labelText, required this.controller,this.actionButton}) : super(key: key);

  String labelText;
  TextEditingController controller;
  Function(String value)? actionButton;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: actionButton,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 12),
          border: OutlineInputBorder()
      ),
    );
  }
}
