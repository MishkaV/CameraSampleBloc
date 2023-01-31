import 'dart:io';
import 'package:flutter/material.dart';

Widget createImageButton({
  double iconWidth = 36.0,
  double iconHeight = 36.0,
  Color? backgroundColor = Colors.white,
  void Function()? onPressed,
}) {
  return Container(); // TODO
  // TODO Color depends on theme
  // return _createBaseContainer(
  //   iconWidth: iconWidth,
  //   iconHeight: iconHeight,
  //   backgroundColor: backgroundColor,
  //   child: StoreConnector<GlobalState, String?>(
  //     distinct: true,
  //     converter: (store) => store.state.galleryState.currentPath,
  //     builder: (context, path) {
  //       return IconButton(
  //         onPressed: onPressed,
  //         icon: path != null
  //             ? Image.file(
  //                 File(path),
  //                 fit: BoxFit.cover, // TODO Normal scale
  //               )
  //             : Container(), // TODO when null
  //       );
  //     },
  //   ),
  // );
}

Widget createIconButton({
  required String iconPath,
  double iconWidth = 36.0,
  double iconHeight = 36.0,
  Color? backgroundColor = Colors.white,
  void Function()? onPressed,
}) {
  // TODO Color depends on theme
  return _createBaseContainer(
    iconWidth: iconWidth,
    iconHeight: iconHeight,
    backgroundColor: backgroundColor,
    child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          iconPath,
          width: iconWidth,
          height: iconHeight,
          fit: BoxFit.fitHeight,
        )),
  );
}

Widget createZoomButton({
  double iconWidth = 36.0,
  double iconHeight = 36.0,
  Color? backgroundColor = Colors.white,
  void Function()? onPressed,
}) {
  // TODO Color depends on theme
  return _createBaseContainer(
    iconWidth: iconWidth,
    iconHeight: iconHeight,
    backgroundColor: backgroundColor,
    child: Container() // TODO
    // StoreConnector<GlobalState, double>(
    //   distinct: true,
    //   converter: (store) => store.state.zoomState.currentZoomLevel,
    //   builder: (context, zoomLevel) {
    //     return InkWell(
    //       child: Center(
    //         child: Text(
    //           "${zoomLevel}x",
    //           style: TextStyle(
    //               color: Colors.black, fontSize: 14.0), // TODO Depence on theme
    //         ),
    //       ),
    //       onTap: onPressed,
    //     );
    //   },
    // ),
  );
}

Widget _createBaseContainer({
  required Widget child,
  double iconWidth = 36.0,
  double iconHeight = 36.0,
  Color? backgroundColor = Colors.white,
}) {
  return Container(
    width: iconWidth,
    height: iconHeight,
    decoration: backgroundColor != null
        ? BoxDecoration(color: backgroundColor, shape: BoxShape.circle)
        : null,
    child: child,
  );
}
