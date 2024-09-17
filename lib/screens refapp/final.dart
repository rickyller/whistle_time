import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class TimerFinal extends StatefulWidget {
  @override
  _TimerFinalState createState() => _TimerFinalState();
}

class _TimerFinalState extends State<TimerFinal> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _arrowController;
  Animation<double>? _arrowAnimation;
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
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Fondo circular para el marcador
            Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black, // Fondo negro
              ),
            ),
            // Semicirculo en la parte superior
            Positioned(
              top: -80,
              child: Container(
                width: 240,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.9),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(240),
                  ),
                ),
              ),
            ),
            // Icono superior (gráfico de barras)
            Positioned(
              top: 10,
              child: Icon(
                Icons.bar_chart,
                color: Colors.blue,
                size: 24,
              ),
            ),
            // Marcador equipo local (LIV)
            Positioned(
              top: 40,
              left: 70,
              child: Column(
                children: [
                  Text(
                    "0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "LIV",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Marcador equipo visitante (MAN)
            Positioned(
              top: 40,
              right: 70,
              child: Column(
                children: [
                  Text(
                    "0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "MAN",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Texto "FINAL" con "45:38" debajo
            Positioned(
              bottom: 72,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Caja con borde blanco para "FINAL"
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "FINAL",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Texto "45:38" justo debajo
                  SizedBox(height: 5), // Espacio entre "FINAL" y "45:38"
                  Text(
                    "45:38",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Botón de recargar
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
                    Icons.refresh,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              ),
            ),
            // Animación Lottie (micro)
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
