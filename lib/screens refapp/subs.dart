import 'package:flutter/material.dart';
import 'package:settings/colors.dart';


class SubstitutionScreen extends StatefulWidget {
  @override
  _SubstitutionScreenState createState() => _SubstitutionScreenState();
}

class _SubstitutionScreenState extends State<SubstitutionScreen> {
  List<int> _selectedOffPlayers = []; // Lista de jugadores seleccionados para salir
  List<int> _selectedOnPlayers = []; // Lista de jugadores seleccionados para entrar

  // Lista de los jugadores titulares y suplentes
  final List<int> startingPlayers = List.generate(11, (index) => index + 1);
  final List<int> substitutePlayers = List.generate(8, (index) => index + 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: Stack(
        children: [
          Positioned(
            top:34,
            left: 90,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 15), // Ajusta el tamaño del icono
              onPressed: () {
                Navigator.pop(context); // Regresar a la pantalla anterior
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                // Título de la pantalla
                Text(
                  "Sustituciones",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10), // Espacio reducido entre título y columnas

                // Etiquetas "Sale" y "Entra"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sale",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Entra",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),

                // Filas con los jugadores
                Expanded(
                  child: Row(
                    children: [
                      // Lista de titulares (jugadores que salen)
                      Expanded(
                        child: ListView.builder(
                          itemCount: startingPlayers.length,
                          itemBuilder: (context, index) {
                            int playerNumber = startingPlayers[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Agregar o remover el jugador de la lista de jugadores que salen
                                  if (_selectedOffPlayers.contains(playerNumber)) {
                                    _selectedOffPlayers.remove(playerNumber);
                                  } else {
                                    _selectedOffPlayers.add(playerNumber);
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: _selectedOffPlayers.contains(playerNumber)
                                      ? Colors.red // Rojo si está seleccionado para salir
                                      : Colors.blueGrey,
                                  child: Text(
                                    "$playerNumber",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Separador entre las dos columnas (más pequeño)
                      SizedBox(width: 10), // Reduce el ancho del separador

                      // Lista de suplentes (jugadores que entran)
                      Expanded(
                        child: ListView.builder(
                          itemCount: substitutePlayers.length,
                          itemBuilder: (context, index) {
                            int playerNumber = substitutePlayers[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Agregar o remover el jugador de la lista de jugadores que entran
                                  if (_selectedOnPlayers.contains(playerNumber)) {
                                    _selectedOnPlayers.remove(playerNumber);
                                  } else {
                                    _selectedOnPlayers.add(playerNumber);
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: _selectedOnPlayers.contains(playerNumber)
                                      ? Colors.green // Verde si está seleccionado para entrar
                                      : Colors.blueGrey,
                                  child: Text(
                                    "$playerNumber",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Botón de confirmación posicionado al fondo
          Positioned(
            bottom: 20,
            right: MediaQuery.of(context).size.width / 2 - 15, // Centrado horizontalmente
            child: GestureDetector(
              onTap: () {
                // Mostrar el diálogo de confirmación
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
                              'Confirmación de Cambios',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal, // Color del texto del título
                                fontSize: 13, // Tamaño de la fuente del título reducido
                              ),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Mostrar lista de jugadores que salen
                            Text(
                              'Jugadores que salen:',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            ..._selectedOffPlayers.map((player) => Text(
                              '$player',
                              style: TextStyle(
                                fontFamily: 'Nud', // Aplicar la fuente "Nud"
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )),
                            SizedBox(height: 10),
                            // Mostrar lista de jugadores que entran
                            Text(
                              'Jugadores que entran:',
                              style: TextStyle(
                                fontFamily: 'Nud', // Aplicar la fuente "Nud"
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            ..._selectedOnPlayers.map((player) => Text(
                              '$player',
                              style: TextStyle(
                                fontFamily: 'Nud', // Aplicar la fuente "Nud"
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )),
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
                                  fontSize: 9, // Tamaño de la fuente aún más pequeño
                                  color: Colors.white, // Letra blanca
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal, // Color del botón
                                minimumSize: Size(40, 24), // Reducir el tamaño mínimo del botón (ancho, alto)
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Ajustar el padding para hacerlo más pequeño
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // Cierra el diálogo
                                print("Cambios confirmados. Jugadores que salen: $_selectedOffPlayers, Jugadores que entran: $_selectedOnPlayers");
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: 15, // Tamaño del círculo
                backgroundColor: Colors.blue, // Color de fondo del círculo
                child: Icon(
                  Icons.check, // Icono de palomita
                  color: Colors.white, // Color del icono
                  size: 15, // Tamaño de la palomita
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
