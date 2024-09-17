import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:settings/colors.dart';


class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _arrowController;
  Animation<double>? _arrowAnimation; // Declaramos sin usar late para evitar problemas de inicialización
  bool isRecording = false;

  @override
  void initState() {
    super.initState();

    // Controlador para Lottie
    _controller = AnimationController(vsync: this);

    // Controlador para la animación de la flecha
    _arrowController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200), // Duración de la animación
    );

    // Inicialización de la animación
    _arrowAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _arrowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _arrowController.dispose();
    super.dispose();
  }

  void toggleRecording() {
    setState(() {
      if (isRecording) {
        _controller.animateTo(0);
      } else {
        _controller.animateTo(30 / 113);
      }
      isRecording = !isRecording;
    });
  }

  // Función para animar la flecha cuando se le hace tap
  void _animateArrow() {
    _arrowController.forward().then((_) {
      _arrowController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.darkGrey,
              ),
            ),
            Positioned(
              top: -80,
              child: Container(
                width: 240,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.blueGrey,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(240),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 15), // Ajusta el tamaño del icono
                onPressed: () {
                  Navigator.pop(context); // Regresar a la pantalla anterior
                },
              ),
            ),
            Positioned(

              top: 10,
              child: Icon(
                Icons.bar_chart,
                color: Colors.blue,
                size: 20,
              ),
            ),
            Positioned(
              top: 40,
              left: 70,
              child: Column(
                children: [

                  Text(
                    "0",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "LIV",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              right: 70,
              child: Column(
                children: [

                  Text(
                    "0",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "MAN",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 72,
              left: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "0:00",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 0),
                      Row(
                        children: [
                          Text(
                            "0:00",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(width: 3), // Espacio para la flecha

                          // Agregamos el GestureDetector para la animación
                          GestureDetector(
                            onTap: _animateArrow, // Animamos la flecha al hacer tap
                            child: ScaleTransition(
                              scale: _arrowAnimation ??
                                  AlwaysStoppedAnimation(1.0), // Verificación de inicialización
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.blue, // Color de la flecha
                                size: 14, // Tamaño de la flecha
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
            Positioned(
              bottom: 90,
              right: 20,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -10,
              child: GestureDetector(
                onTap: toggleRecording,
                child: Lottie.asset(
                  'assets/micro_blue.json',
                  width: 80,
                  height: 80,
                  controller: _controller,
                  onLoaded: (composition) {
                    setState(() {
                      _controller.duration = composition.duration;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
