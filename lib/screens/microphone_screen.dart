import 'package:flutter/material.dart';
import 'package:settings/screens/matchResult_screen.dart';
import 'package:settings/screens/start_screen.dart';
import 'package:settings/screens/stopWatch_screen.dart';
import 'package:wear/wear.dart';
import 'package:lottie/lottie.dart';

import '../colors.dart'; // Asegúrate de que 'AppColors.darkBlue' esté definido en este archivo

class MicrophoneScreen extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final PageController pageController;

  MicrophoneScreen({
    required this.screenHeight,
    required this.screenWidth,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (context, shape, child) {
        return AmbientMode(
          builder: (context, mode, child) => mode == WearMode.active
              ? MicrophonePageView(screenHeight, screenWidth, pageController)
              : AmbientWatchFace(),
        );
      },
    );
  }
}

class MicrophonePageView extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;
  final PageController pageController;

  MicrophonePageView(this.screenHeight, this.screenWidth, this.pageController);

  @override
  _MicrophonePageViewState createState() => _MicrophonePageViewState();
}

class _MicrophonePageViewState extends State<MicrophonePageView> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: MicrophoneScreenUI(
              screenHeight: widget.screenHeight,
              screenWidth: widget.screenWidth,
              isRecording: isRecording,
              toggleRecording: () {
                setState(() {
                  isRecording = !isRecording;
                });
              },
            ),
          ),
          // Botón flotante en forma de media luna más pequeño y pegado al borde izquierdo
          Positioned(
            top: MediaQuery.of(context).size.height * 0.22, // Centrado verticalmente
            left: 4, // Muy pegado al borde izquierdo
            child: GestureDetector(
              onTap: () {
                if (widget.pageController.hasClients &&
                    widget.pageController.page != 0) {
                  widget.pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Container(
                width: 40, // Más pequeño y discreto
                height: 120, // Más pequeño y alto para mantener la forma de media luna
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0), // Mayor transparencia para ser más discreto
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120), // Ajustando el borde redondeado para adaptarse mejor
                    bottomLeft: Radius.circular(120),
                  ),
                ),
                child: Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                  size: 33, // Icono más pequeño
                ),
              ),
            ),
          ),
          // Botón flotante en forma de media luna más pequeño y pegado al borde derecho
          Positioned(
            top: MediaQuery.of(context).size.height * 0.22, // Centrado verticalmente
            right: 4, // Muy pegado al borde derecho
            child: GestureDetector(
              onTap: () {
                if (widget.pageController.hasClients &&
                    widget.pageController.page != widget.pageController.positions.first.maxScrollExtent) {
                  widget.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Container(
                width: 40, // Más pequeño y discreto
                height: 120, // Más pequeño y alto para mantener la forma de media luna
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0), // Mayor transparencia para ser más discreto
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(120), // Ajustando el borde redondeado para adaptarse mejor
                    bottomRight: Radius.circular(120),
                  ),
                ),
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 33, // Icono más pequeño
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MicrophoneScreenUI extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final bool isRecording;
  final VoidCallback toggleRecording;

  const MicrophoneScreenUI({
    required this.screenHeight,
    required this.screenWidth,
    required this.isRecording,
    required this.toggleRecording,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue, // Fondo de la pantalla en darkBlue
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Para asegurarnos de que el borde sea circular
            border: Border.all(
              color: AppColors.black, // Color del diámetro
              width: 5, // Ancho del borde
            ),
          ),
          height: screenHeight * 1.5, // Ajustando el tamaño para que quede un poco dentro del borde
          width: screenWidth * 1.5, // Ajustando el tamaño para que quede un poco dentro del borde
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Cambiado de center a start para alinear hacia arriba
            children: <Widget>[
              // Lottie Animation (puedes ajustar su tamaño si es necesario)
              GestureDetector(
                onTap: toggleRecording,
                child: Lottie.asset(
                  'assets/microphone_animation.json', // Ruta de tu animación Lottie
                  width: screenWidth * .80,
                  height: screenWidth * .80, // Ajusta este valor si es necesario
                  repeat: isRecording,
                  animate: isRecording,
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // Reducir este espacio si es necesario
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    isRecording ? 'Grabando...' : 'Toca para grabar',
                    key: ValueKey(isRecording), // Clave única para la transición
                    style: TextStyle(
                      fontFamily: 'nud',  // Fuente personalizada
                      fontSize: screenHeight * 0.055,  // Tamaño ajustado del texto
                      color: Colors.white, // El color del texto
                      fontWeight: FontWeight.w600,  // Peso de la fuente
                      shadows: [
                        Shadow(
                          blurRadius: 6.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}


class AmbientWatchFace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue, // Fondo en modo ambiente
      body: Center(
        child: Text(
          'Ambient Mode',
          style: TextStyle(
            color: Colors.white, // El color del texto en modo ambiente
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
