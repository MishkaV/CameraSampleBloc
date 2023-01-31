import 'dart:io';

import 'package:flutter/material.dart';

class CameraPageHeader extends StatelessWidget {
  const CameraPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Color iconColor = Colors.white;
    double iconSize = 24.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // TODO Also depends on theme
        // TODO Hardcode?
        IconButton(
            onPressed: () => exit(0),
            iconSize: iconSize,
            icon: Icon(Icons.close, color: iconColor)),
        Text(
          "Scan your thing",
          style: TextStyle(
            fontFamily: 'GT Maru',
            color: iconColor,
            fontSize: 17,
          ),
        ),
        IconButton(
            onPressed: () {},
            iconSize: iconSize,
            icon: Image.asset(
              "assets/icons/camera/export_button.png",
              width: iconSize,
              height: iconSize,
            )),
      ],
    );
  }
}
