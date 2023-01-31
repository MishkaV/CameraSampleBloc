import 'package:camera_sample_bloc2/blocs/camera/camera_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helpers/ButtonCreateHelpers.dart';

class CameraPageFooter extends StatelessWidget {
  const CameraPageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        createIconButton(
          iconPath: "assets/icons/camera/flash_on.png",
          onPressed: () => BlocProvider.of<CameraBloc>(context).add(CameraFlashChange()),
        ),
        createIconButton(
          iconPath: "assets/icons/camera/change_camera.png",
          onPressed: () => BlocProvider.of<CameraBloc>(context).add(CameraChange())
        ),
        createIconButton(
          iconPath: "assets/icons/camera/take_photo_button.png",
          iconWidth: 100.0,
          iconHeight: 104.0,
          backgroundColor: null
        ),
        createZoomButton(),
        createImageButton(), // TODO onPress?
      ],
    );
  }
}
