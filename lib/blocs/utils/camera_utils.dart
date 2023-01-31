import 'dart:io';

import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

class CameraUtils {
  Future<CameraController> getCameraController(
    CameraLensDirection cameraLensDirection,
    ResolutionPreset resolutionPreset,
  ) async {
    final cameras = await availableCameras();
    final camera = cameras
        .firstWhere((camera) => camera.lensDirection == cameraLensDirection);

    return CameraController(camera, resolutionPreset, enableAudio: false);
  }

  Future<String> getPath() async {
    final Directory extDir = await getTemporaryDirectory();
    final cameraSampleDir =
        await Directory('${extDir.path}/cameraSample').create(recursive: true);
    return '${cameraSampleDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  static CameraUtils build() => CameraUtils();
}
