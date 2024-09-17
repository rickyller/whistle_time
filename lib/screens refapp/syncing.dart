import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SyncScreen(),
    );
  }
}

class SyncScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Texto principal
            Text(
              "¿Sincronizar con el teléfono?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12, // Tamaño más pequeño
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0, // Espaciado ajustado
              ),
            ),
            SizedBox(height: 5), // Espacio entre texto principal y subtítulo
            // Subtítulo
            Text(
              "Enviará los datos de partido al teléfono",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 10, // Tamaño de fuente reducido
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 30), // Espacio entre el texto y los botones
            // Fila con los botones
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botón de cancelar
                GestureDetector(
                  onTap: () {
                    // Acción para cancelar
                    print("Cancelled");
                  },
                  child: Container(
                    width: 50, // Tamaño más pequeño
                    height: 50, // Tamaño más pequeño
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30, // Tamaño del ícono más pequeño
                    ),
                  ),
                ),
                SizedBox(width: 20), // Espacio reducido entre los botones
                // Botón de confirmar
                GestureDetector(
                  onTap: () {
                    // Acción para confirmar
                    print("Confirmed");
                  },
                  child: Container(
                    width: 50, // Tamaño más pequeño
                    height: 50, // Tamaño más pequeño
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30, // Tamaño del ícono más pequeño
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
