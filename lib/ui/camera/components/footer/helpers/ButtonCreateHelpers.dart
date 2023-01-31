import 'package:flutter/material.dart';

Widget createImageButton({
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
      icon: Container(),
    ),
  );
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
