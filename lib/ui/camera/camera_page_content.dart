import 'package:camera_sample_bloc2/ui/camera/components/footer/camera_page_footer.dart';
import 'package:camera_sample_bloc2/ui/camera/components/header/camera_page_header.dart';
import 'package:camera_sample_bloc2/ui/camera/components/preview/camera_page_preview.dart';
import 'package:flutter/material.dart';


class CameraPageContent extends StatelessWidget {

  const CameraPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // TODO Depends in theme
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Flexible(child: CameraPageHeader()),
          Flexible(flex: 8, child: CameraPagePreview()),
          Flexible(child: CameraPageFooter()),
        ],
      ),
    );
  }
}