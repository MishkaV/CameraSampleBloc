import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:camera_sample_bloc2/blocs/utils/camera_utils.dart';
import 'package:equatable/equatable.dart';

part 'camera_event.dart';

part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final CameraUtils cameraUtils;
  final ResolutionPreset resolutionPreset;
  final CameraLensDirection cameraLensDirection;

  CameraController? _controller;

  CameraBloc({
    required this.cameraUtils,
    this.resolutionPreset = ResolutionPreset.high,
    this.cameraLensDirection = CameraLensDirection.back,
  }) : super(CameraInitial()) {
    on<CameraInitialized>(_mapCameraInitializedToState);
    on<CameraCaptured>(_mapCameraCapturedToState);
    on<CameraStopped>(_mapCameraStoppedToState);
  }

  CameraController? getController() => _controller;

  bool isInitialized() => _controller?.value?.isInitialized ?? false;

  void _mapCameraInitializedToState(
    CameraInitialized event,
    Emitter<CameraState> emit,
  ) async {
    try {
      _controller = await cameraUtils.getCameraController(
          cameraLensDirection, resolutionPreset);
      await _controller?.initialize();
      emit.call(CameraReady());
    } on CameraException catch (error) {
      _controller?.dispose();
      emit.call(CameraFailure(error: error.description.toString()));
    } catch (error) {
      emit.call(CameraFailure(error: error.toString()));
    }
  }

  void _mapCameraCapturedToState(
    CameraCaptured event,
    Emitter<CameraState> emit,
  ) async {
    if (state is CameraReady) {
      emit.call(CameraCaptureInProgress());
      try {
        final file = await _controller?.takePicture();
        if (file != null) {
          emit.call(CameraCaptureSuccess(file.path));
        } else {
          emit.call(CameraCaptureFailure(error: "Path is null"));
        }
      } on CameraException catch (error) {
        emit.call(CameraCaptureFailure(error: error.description.toString()));
      }
    }
  }

  void _mapCameraStoppedToState(
    CameraStopped event,
    Emitter<CameraState> emit,
  ) async {
    _controller?.dispose();
    emit.call(CameraInitial());
  }

  @override
  Future<void> close() {
    _controller?.dispose();
    return super.close();
  }
}
