import 'package:camera_sample_bloc2/blocs/camera/camera_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../blocs/utils/camera_utils.dart';
import 'assemble.config.dart';

final getIt = GetIt.I;

@InjectableInit()
void setup() => getIt.init();

@module
abstract class AssembleModule {
  @injectable
  CameraUtils provideCameraUtils() => CameraUtils();

  @lazySingleton
  CameraBloc provideCameraBloc(CameraUtils cameraUtils) =>
      CameraBloc(cameraUtils: cameraUtils);
}

class Assemble {

  CameraBloc get camera => getIt.get<CameraBloc>();

  const Assemble._();
}

const assemble = Assemble._();
