part of 'camera_bloc.dart';

class CameraState extends Equatable {
  final FlashMode flashMode;

  static const CameraState empty = CameraState();

  const CameraState({this.flashMode = FlashMode.off});

  @override
  List<Object> get props => [];

  CameraState copyWith({
    FlashMode? flashMode,
  }) =>
      CameraState(
        flashMode: flashMode ?? this.flashMode,
      );
}

// Init States
class CameraInitial extends CameraState {}

class CameraReady extends CameraState {}

class CameraFailure extends CameraState {
  final String error;

  CameraFailure({this.error = "CameraFailure"});

  @override
  List<Object> get props => [error];
}

// Capture States
class CameraCaptureInProgress extends CameraState {}

class CameraCaptureSuccess extends CameraState {
  final String path;

  CameraCaptureSuccess(this.path);
}

class CameraCaptureFailure extends CameraReady {
  final String error;

  CameraCaptureFailure({this.error = "CameraFailure"});

  @override
  List<Object> get props => [error];
}
