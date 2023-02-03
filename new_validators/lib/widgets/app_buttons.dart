

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppEelevatedButtons extends StatelessWidget {
  AppEelevatedButtons({Key? key, required this.nameButton, this.actionButton}) : super(key: key);

  String nameButton;
  Function()? actionButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: actionButton,
        child: Text(nameButton),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: Size(double.infinity, 60)
        ),
    );
  }
}
