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
  CameraLensDirection cameraLensDirection;

  CameraController? _controller;

  CameraBloc({
    required this.cameraUtils,
    this.resolutionPreset = ResolutionPreset.high,
    this.cameraLensDirection = CameraLensDirection.back,
  }) : super(CameraState.empty) {
    on<CameraInitialized>(_onCameraInitialized);
    on<CameraCaptured>(_onCameraCaptured);
    on<CameraStopped>(_onCameraStopped);
    on<CameraChange>(_onCameraChange);
    on<CameraFlashChange>(_onCameraFlashChange);
  }

  CameraController? getController() => _controller;

  bool isInitialized() => _controller?.value?.isInitialized ?? false;

  void _onCameraInitialized(
    CameraInitialized event,
    Emitter<CameraState> emit,
  ) async {
    await _initCamera(emit, cameraLensDirection, resolutionPreset);
  }

  void _onCameraChange(
    CameraChange event,
    Emitter<CameraState> emit,
  ) async {
    cameraLensDirection = cameraLensDirection == CameraLensDirection.back
        ? CameraLensDirection.front
        : CameraLensDirection.back;
    emit.call(CameraInitial()); // TODO FIX
  }

  Future<void> _initCamera(
    Emitter<CameraState> emit,
    CameraLensDirection cameraLensDirection,
    ResolutionPreset resolutionPreset,
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

  void _onCameraFlashChange(
    CameraFlashChange event,
    Emitter<CameraState> emit,
  ) async {
    var newFlashMode =
        state.flashMode == FlashMode.off ? FlashMode.torch : FlashMode.off;
    await _controller?.setFlashMode(newFlashMode);
    emit(state.copyWith(flashMode: newFlashMode));
  }

  void _onCameraCaptured(
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

  void _onCameraStopped(
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

  ///
  @override
  void onTransition(Transition<CameraEvent, CameraState> transition) {
    super.onTransition(transition);
    print('Bloc: ${transition.event.runtimeType}:'
        ' ${transition.currentState.flashMode}'
        '-> ${transition.nextState.flashMode}');
  }
}
