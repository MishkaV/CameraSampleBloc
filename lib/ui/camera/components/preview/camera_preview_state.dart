import 'package:camera_sample_bloc2/blocs/camera/camera_bloc.dart';
import 'package:camera_sample_bloc2/ui/camera/components/preview/camera_page_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraPreviewState extends State<CameraPagePreview> {
  // TODO Permissions?

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 28.0, 8.0, 16.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(36)),
          child: BlocProvider.of<CameraBloc>(context)
                  .getController()
                  ?.buildPreview() ??
              Container()
          ),
    );
  }
}
