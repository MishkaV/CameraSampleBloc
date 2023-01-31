
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/error.json"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Text("Sorry, something go wrong, please try again", style: TextStyle(fontSize: 24), textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}