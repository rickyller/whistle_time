import 'package:flutter/material.dart';
import 'package:settings/colors.dart';
import 'package:settings/screens%20refapp/final.dart';
import 'package:settings/screens%20refapp/red_cards.dart';
import 'package:settings/screens%20refapp/subs.dart';
import 'package:settings/screens%20refapp/timer.dart';
import 'package:settings/screens%20refapp/yellow_cards.dart';
import 'goal.dart'; // Importa la pantalla GoalScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/goal': (context) => GoalScreen(), // Añade la ruta para GoalScreen
        '/yellow_card': (context) => WarningSelectionScreen(),
        '/red_card': (context) => ExpulsionSelectionScreen(),
        '/subs': (context) => SubstitutionScreen(),
        '/timer': (context) => TimerScreen(),

      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: Stack(
        children: [

          // Custom Paint para la media luna
          Positioned.fill(
            child: CustomPaint(
              painter: DiagonalMoonPainter(),
            ),
          ),
          // Contenido de la pantalla
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título de la pantalla
                Text(
                  "Liverpool",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15, // Tamaño ajustado de la fuente
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10), // Espacio reducido
                // Contenedor para los iconos con el temporizador en el centro
                Container(
                  width: 300, // Ancho adecuado para los iconos
                  child: Stack(
                    alignment: Alignment.center, // Colocar el temporizador en el centro
                    children: [
                      Column(
                        children: [
                          // Primera fila de iconos
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center, // Alineación vertical
                            children: [
                              // Icono de portería
                              GestureDetector(
                                onTap: () {
                                  try {
                                    Navigator.pushNamed(context, '/goal');
                                  } catch (e) {
                                    print("Error navegando a la pantalla Goal: $e");
                                  }
                                },

                                child: Container(
                                  width: 70,
                                  height: 70,
                                  child: Image.asset(
                                    'assets/icons/porteria.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(width: 97), // Añadir un espacio personalizado entre los íconos
                              // Icono de tarjeta amarilla
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/yellow_card'); // Navega a GoalScreen
                                },
                                child: Transform.translate(
                                  offset: Offset(-14, 0), // Mueve la tarjeta amarilla a la izquierda
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    child: Image.asset(
                                      'assets/icons/yellow_card.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30), // Espacio entre filas
                          // Segunda fila de iconos
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center, // Alineación vertical
                            children: [
                              // Icono de tarjeta roja
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/red_card'); // Navega a GoalScreen
                                },
                                child: Transform.translate(
                                  offset: Offset(10, 0), // Mueve la tarjeta roja a la derecha
                                  child: Container(
                                    width: 27,
                                    height: 27,
                                    child: Image.asset(
                                      'assets/icons/red_card.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 87), // Añadir un espacio personalizado entre los íconos
                              // Icono de bandera
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/subs'); // Navega a GoalScreen
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset(
                                    'assets/icons/bandera.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Icono del temporizador en el centro
                      Positioned(
                        left: 90, // Ajusta el valor para moverlo más a la derecha
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/timer'); // Navega a GoalScreen
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              'assets/icons/timer.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Clase para dibujar la media luna diagonal
class DiagonalMoonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0)
      ..style = PaintingStyle.fill;

    // Aplica la rotación de 180 grados
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(3.1416); // Rotar 180 grados
    canvas.translate(-size.width / 2, -size.height / 2);

    final path = Path()
      ..moveTo(0, size.height * -0.2)
      ..quadraticBezierTo(size.width * -4.5, size.height * -4, size.width, size.height * 1)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
