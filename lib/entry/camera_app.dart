import 'package:camera_sample_bloc2/data/assemble.dart';
import 'package:camera_sample_bloc2/ui/camera/camera_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CameraApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  var _dark = false;

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      BlocProvider.value(value: assemble.camera)
    ],
    child: MaterialApp(
      theme:
      ThemeData(brightness: _dark ? Brightness.dark : Brightness.light),
      home: CameraPage(),
    ),
  );
}