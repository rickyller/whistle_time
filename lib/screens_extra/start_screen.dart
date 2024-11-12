import 'package:flutter/material.dart';
import 'package:settings/screens_extra/stopWatch_screen.dart'; // Asegúrate de importar StopwatchScreen
import '../colors.dart';
import '../utils.dart';
import '../wear.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,  // Fondo negro
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

          // Definir el PageController que será pasado a StopwatchScreen
          final PageController pageController = PageController(initialPage: 0);

          return Center(
            child: Container(
              color: AppColors.black,  // Fondo negro
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
                      backgroundColor: AppColors.teal,  // Color verde azulado
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'START',
                      style: TextStyle(color: AppColors.white, fontSize: 16),  // Texto en blanco
                    ),
                    onPressed: () {
                      // Navegar a StopwatchScreen con PageView, pasando el PageController
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return StopwatchScreen(pageController: pageController); // Pasar el PageController aquí
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
