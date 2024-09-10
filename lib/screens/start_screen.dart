import 'package:flutter/material.dart';
import 'microphone_screen.dart';
import 'name_screen.dart';
import '../utils.dart';
import '../wear.dart';
import '../colors.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,  // Usa el color blanco de tu paleta
      body: WatchShape(
        builder: (context, shape) {
          var screenSize = MediaQuery.of(context).size;
          final inheritedShape = InheritedShape.of(context)?.shape;
          if (inheritedShape == Shape.round) {
            screenSize = Size(boxInsetLength(screenSize.width / 2),
                boxInsetLength(screenSize.height / 2));
          }
          var screenHeight = screenSize.height;
          var screenWidth = screenSize.width;

          return Center(
            child: Container(
              color: AppColors.black,  // Usa el color blanco
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.asset('assets/whistle_time_logo.png', width: 100, height: 100),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.teal,  // Usa el color verde azulado
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'START',
                      style: TextStyle(color: AppColors.white, fontSize: 16),  // Texto en blanco
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return MicrophoneScreen(screenHeight, screenWidth);
                        }),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
