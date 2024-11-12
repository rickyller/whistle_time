import 'package:flutter/material.dart';
import 'package:settings/colors.dart'; // Asegúrate de que 'AppColors' esté definido

class MatchResultScreen extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final PageController pageController;

  MatchResultScreen(this.screenHeight, this.screenWidth, {required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue, // Fondo oscuro para el contraste
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Para asegurarnos de que el borde sea circular
                border: Border.all(
                  color: AppColors.black, // Color del diámetro
                  width: 5, // Ancho del borde
                ),
              ),
              height: screenHeight, // Ajuste para ocupar todo el alto de la pantalla
              width: screenWidth, // Ajuste para ocupar todo el ancho de la pantalla
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.1), // Padding vertical para mantener contenido centrado
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Contenedor para el nombre del partido
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.03,
                        horizontal: screenWidth * 0.15), // Ajuste del padding basado en las dimensiones de la pantalla
                    decoration: BoxDecoration(
                      color: AppColors.black, // Fondo oscuro para el nombre del partido
                      borderRadius: BorderRadius.circular(10), // Bordes redondeados
                    ),
                    child: Text(
                      'PUM - CHV', // Nombre del partido
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.04, // Tamaño del texto adaptado a la altura de la pantalla
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05), // Espacio entre el nombre del partido y los resultados
                  // Resultados de los equipos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Resultado del primer equipo
                      Container(
                        width: screenWidth * 0.2, // Ajuste del ancho basado en el tamaño de la pantalla
                        height: screenHeight * 0.1, // Ajuste de la altura basado en el tamaño de la pantalla
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(10), // Bordes redondeados
                        ),
                        child: Center(
                          child: Text(
                            '1', // Resultado del primer equipo
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.05, // Tamaño del texto adaptado a la pantalla
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.1), // Espacio entre los resultados
                      // Resultado del segundo equipo
                      Container(
                        width: screenWidth * 0.2, // Ajuste del ancho basado en el tamaño de la pantalla
                        height: screenHeight * 0.1, // Ajuste de la altura basado en el tamaño de la pantalla
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(10), // Bordes redondeados
                        ),
                        child: Center(
                          child: Text(
                            '0', // Resultado del segundo equipo
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.05, // Tamaño del texto adaptado a la pantalla
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Botón flotante en forma de media luna pegado al borde izquierdo
          Positioned(
            top: screenHeight * 0.22, // Centrado verticalmente
            left: 4, // Muy pegado al borde izquierdo
            child: GestureDetector(
              onTap: () {
                if (pageController.hasClients && pageController.page != 0) {
                  pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Container(
                width: 40,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0), // Mayor transparencia para ser más discreto
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120), // Ajustando el borde redondeado
                    bottomLeft: Radius.circular(120),
                  ),
                ),
                child: Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                  size: 33,
                ),
              ),
            ),
          ),
          // Botón flotante en forma de media luna pegado al borde derecho
          Positioned(
            top: screenHeight * 0.22, // Centrado verticalmente
            right: 4, // Muy pegado al borde derecho
            child: GestureDetector(
              onTap: () {
                if (pageController.hasClients &&
                    pageController.page != pageController.positions.first.maxScrollExtent) {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Container(
                width: 40,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0), // Mayor transparencia para ser más discreto
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(120), // Ajustando el borde redondeado
                    bottomRight: Radius.circular(120),
                  ),
                ),
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 33,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
