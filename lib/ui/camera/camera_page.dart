import 'package:camera_sample_bloc2/blocs/camera/camera_bloc.dart';
import 'package:camera_sample_bloc2/ui/camera/camera_page_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'error/error_screen.dart';

class CameraPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<CameraBloc>(context).add(CameraInitialized());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<CameraBloc>(context);

    // App state changed before we got the chance to initialize.
    if (!bloc.isInitialized()) return;

    if (state == AppLifecycleState.inactive)
      bloc.add(CameraStopped());
    else if (state == AppLifecycleState.resumed) bloc.add(CameraInitialized());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CameraBloc, CameraState>(
            builder: (_, state) {
              if (state is CameraFailure) {
                return const ErrorScreen();
              }

              if (state is CameraReady) {
                return CameraPageContent();
              }

              return const Center(child: CircularProgressIndicator());
            }
        ),
      ),
    );
  }
}
