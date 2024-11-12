import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MatchScreen(),
    );
  }
}

class MatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Match Timer"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.watch, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Temporizador con el botón de pausa
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '55:43',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '56:17',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                // Botón de pausa
                FloatingActionButton(
                  onPressed: () {
                    // Acción para pausar
                  },
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.pause,
                    color: Colors.white, // Cambia el color del icono a blanco
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Puntaje de los equipos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ScoreBox(team: "LIVERPOOL", score: "1"),
                ScoreBox(team: "MANCHESTER UNITED", score: "2"),
              ],
            ),
            SizedBox(height: 24),

            // Lista de eventos
            Expanded(
              child: ListView(
                children: [
                  EventSection(title: "SECOND HALF"),
                  EventItem(
                    minute: "52'",
                    event: "Goal",
                    player: "#17 Troy Pendleton",
                  ),
                  EventItem(
                    minute: "46'",
                    event: "Yellow Card",
                    description: "Unsporting Behaviour",
                    player: "#11 Stephan Moore",
                  ),
                  Divider(),
                  EventSection(title: "FIRST HALF"),
                  // Agregar más eventos en la primera mitad, si es necesario
                ],
              ),
            ),
          ],
        ),
      ),
      // Botón flotante para agregar más eventos
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción para añadir un nuevo evento
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white, // Cambia el color del icono a blanco
        ),
      ),
    );
  }
}

// Widget para mostrar el puntaje de un equipo
class ScoreBox extends StatelessWidget {
  final String team;
  final String score;

  const ScoreBox({Key? key, required this.team, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white, // Fondo blanco
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // Cambia la posición de la sombra
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            score,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            team,
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Widget para la sección de eventos (como "SECOND HALF", "FIRST HALF")
class EventSection extends StatelessWidget {
  final String title;

  const EventSection({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}

// Widget para un item de evento (como gol o tarjeta)
class EventItem extends StatelessWidget {
  final String minute;
  final String event;
  final String? description;
  final String player;

  const EventItem({
    Key? key,
    required this.minute,
    required this.event,
    this.description,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$minute $event',
            style: TextStyle(fontSize: 16),
          ),
          if (description != null)
            Text(
              description!,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          Text(
            player,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
