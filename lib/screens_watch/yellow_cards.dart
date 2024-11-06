import 'package:flutter/material.dart';
import 'package:settings/colors.dart';


class WarningSelectionScreen extends StatefulWidget {
  @override
  _WarningSelectionScreenState createState() => _WarningSelectionScreenState();
}

class _WarningSelectionScreenState extends State<WarningSelectionScreen> {
  String? _selectedCause; // Causal seleccionada
  int? _selectedPlayer = 1; // Jugador 1 seleccionado por defecto

  final List<String> causes = [
    '1: Retrasar reanudación',
    '2: Desaprobar',
    '3: Entrar/Salir sin permiso',
    '4: No respetar distancia',
    '5: Infringir reiteradamente',
    '6: Conducta antideportiva',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: Stack(
        children: [
          Positioned(
            top: 14,
            left: 50,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 15), // Ajusta el tamaño del icono
              onPressed: () {
                Navigator.pop(context); // Regresar a la pantalla anterior
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10), // Espacio antes del título
              // Título de la pantalla
              Text(
                "Amonestaciones",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // Tamaño de fuente reducido
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Subtítulo debajo del título "Amonestaciones"
              Text(
                "Liverpool",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12, // Tamaño de fuente reducido
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 3), // Espacio reducido entre título y opciones

              // Lista de causales con scroll
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < causes.length; i++) // Causales en una sola columna
                          RadioListTile<String>(
                            activeColor: Colors.blue, // Color del radio seleccionado
                            title: Text(
                              causes[i],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10, // Tamaño de fuente ajustado
                              ),
                            ),
                            value: causes[i],
                            groupValue: _selectedCause,
                            visualDensity: VisualDensity(horizontal: 0, vertical: -2), // Ajustar el espacio
                            onChanged: (value) {
                              setState(() {
                                _selectedCause = value;
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              // Divider para separar la sección
              Divider(
                color: Colors.white24,
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),

              // Texto encima de los números de los jugadores
              Padding(
                padding: const EdgeInsets.only(bottom: 0), // Espacio ajustado
                child: Text(
                  "Número de camiseta",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10, // Tamaño de fuente reducido
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              // Espacio oval donde se visualizarán las bolitas
              Expanded(
                child: ClipOval(
                  child: Container(
                    width: 50, // Ancho ajustado
                    height: 60, // Alto ajustado
                    color: Colors.grey.withOpacity(0.2), // Fondo del área oval
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0.1),
                      itemCount: 11, // Total de jugadores (del 1 al 11)
                      itemExtent: 60, // Controla la altura de cada ítem
                      itemBuilder: (context, index) {
                        int playerNumber = index + 1; // Número del jugador
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              // Si el jugador ya está seleccionado, deseleccionarlo
                              if (_selectedPlayer == playerNumber) {
                                _selectedPlayer = null;
                              } else {
                                _selectedPlayer = playerNumber; // Seleccionar el jugador
                              }
                            });
                          },
                          child: Center(
                            child: CircleAvatar(
                              radius: 20, // Tamaño de cada bolita ajustado
                              backgroundColor: _selectedPlayer == playerNumber
                                  ? AppColors.teal // Color verde para el jugador seleccionado
                                  : Colors.blueGrey, // Color predeterminado para el resto
                              child: Text(
                                "$playerNumber",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16, // Tamaño de fuente ajustado
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Botón circular de confirmación sobre la lista usando Stack
          Positioned(
            right: 40,
            bottom: 25,
            child: GestureDetector(
              onTap: _selectedPlayer != null && _selectedCause != null
                  ? () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppColors.darkGrey,                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      titlePadding: EdgeInsets.symmetric(vertical: 8), // Reducir padding superior e inferior del título
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Reducir padding del contenido
                      title: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Confirmación',
                              style: TextStyle(
                                fontFamily: 'Nud', // Aplicar la fuente "Nud"
                                fontWeight: FontWeight.bold,
                                color: AppColors.teal, // Color del texto del título
                                fontSize: 13, // Tamaño de la fuente del título reducido
                              ),
                            ),
                            SizedBox(height: 5), // Reducir el espacio entre el título y el contenido
                            Text(
                              'Jugador número $_selectedPlayer',
                              style: TextStyle(
                                fontFamily: 'Nud', // Aplicar la fuente "Nud"
                                fontSize: 12, // Fuente más pequeña
                                color: Colors.white,
                              ), // Texto blanco para mejor visibilidad
                            ),
                            Text(
                              'Causal: $_selectedCause',
                              style: TextStyle(
                                fontFamily: 'Nud', // Aplicar la fuente "Nud"
                                fontSize: 12, // Fuente más pequeña
                                color: Colors.white,
                              ), // Texto blanco
                            ),
                          ],
                        ),
                      ),
                      actionsPadding: EdgeInsets.only(bottom: 4), // Reducir el espacio entre las acciones y el borde inferior
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, // Centrar los botones
                          children: [
                            TextButton(
                              child: Text(
                                'Cancelar',
                                style: TextStyle(
                                  fontFamily: 'Nud', // Aplicar la fuente "Nud"
                                  color: Colors.red,
                                  fontSize: 9, // Tamaño de fuente aún más pequeño
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // Cierra el diálogo
                              },
                            ),
                            SizedBox(width: 8), // Ajustar el espacio entre los botones
                            ElevatedButton(
                              child: Text(
                                'Confirmar',
                                style: TextStyle(
                                  fontFamily: 'Nud', // Aplicar la fuente "Nud"
                                  fontSize: 9, // Tamaño de la fuente aún más pequeño
                                  color: Colors.white, // Letra blanca
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.teal, // Color del botón
                                minimumSize: Size(40, 24), // Reducir el tamaño mínimo del botón (ancho, alto)
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Ajustar el padding para hacerlo más pequeño
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // Cierra el diálogo
                                // Aquí puedes agregar la acción que quieras realizar al confirmar
                                print("Confirmado: Jugador $_selectedPlayer con causal $_selectedCause");
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              }
                  : null,
              child: CircleAvatar(
                radius: 12, // Tamaño del botón circular ajustado
                backgroundColor: _selectedPlayer != null
                    ? AppColors.blue // Color azul cuando hay jugador seleccionado
                    : Colors.blueGrey, // Color gris cuando no está habilitado
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 12, // Tamaño del icono ajustado
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
