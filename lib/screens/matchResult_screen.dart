import 'package:flutter/material.dart';
import 'package:settings/colors.dart';

class MatchResultScreen extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  // Constructor para recibir las dimensiones de la pantalla
  MatchResultScreen(this.screenHeight, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue, // Fondo oscuro para el contraste
      body: Center(
        child: Container(
          // Este container es el que contendrá el borde negro alrededor de la pantalla
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
                  horizontal: screenWidth * 0.15,
                ), // Ajuste del padding basado en las dimensiones de la pantalla
                decoration: BoxDecoration(
                  color: AppColors.black, // Fondo oscuro para el nombre del partido
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                  border: Border.all(
                    color: Colors.black, // Borde negro alrededor del nombre del partido
                    width: 2.0, // Grosor del borde
                  ),
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
                  // Resultado del primer equipo con borde
                  Container(
                    width: screenWidth * 0.2, // Ajuste del ancho basado en el tamaño de la pantalla
                    height: screenHeight * 0.1, // Ajuste de la altura basado en el tamaño de la pantalla
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(10), // Bordes redondeados
                      border: Border.all(
                        color: Colors.black, // Borde negro alrededor del contenedor
                        width: 2.0, // Grosor del borde
                      ),
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
                  // Resultado del segundo equipo con borde
                  Container(
                    width: screenWidth * 0.2, // Ajuste del ancho basado en el tamaño de la pantalla
                    height: screenHeight * 0.1, // Ajuste de la altura basado en el tamaño de la pantalla
                    decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(10), // Bordes redondeados
                      border: Border.all(
                        color: Colors.black, // Borde negro alrededor del contenedor
                        width: 2.0, // Grosor del borde
                      ),
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
    );
  }
}
