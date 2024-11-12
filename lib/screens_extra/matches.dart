import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:settings/colors.dart';
import 'package:settings/screens_extra/addMatch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark; // Valor inicial: depende del sistema

  void _toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.dark) {
        _themeMode = ThemeMode.light;
      } else {
        _themeMode = ThemeMode.dark;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.blue,
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(color: AppColors.darkBlue),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.teal,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkBlue,
          selectedItemColor: AppColors.teal,
          unselectedItemColor: AppColors.grey,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.teal,
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: AppBarTheme(color: AppColors.darkBlue),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.teal,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkBlue,
          selectedItemColor: AppColors.teal,
          unselectedItemColor: AppColors.grey,
        ),
      ),
      themeMode: _themeMode, // Controla si es claro u oscuro
      home: PartidosScreen(
        toggleTheme: _toggleTheme, // Pasamos la función para alternar tema
        isDarkMode: _themeMode == ThemeMode.dark,
      ),
      routes: {
        '/addMatch': (context) => AddMatchScreen(),
      },
    );
  }
}

class PartidosScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  PartidosScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  _PartidosScreenState createState() => _PartidosScreenState();
}

class _PartidosScreenState extends State<PartidosScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Partidos"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.wb_sunny : Icons.nights_stay,
              color: AppColors.teal,
            ),
            onPressed: widget.toggleTheme,
          ),
          IconButton(
            icon: Icon(Icons.calendar_today, color: AppColors.teal),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: AppColors.teal),
            onPressed: () {},
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.sports_soccer, color: AppColors.teal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Próximo partido",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.teal,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTimeBox('Días', '0'),
                SizedBox(width: 10),
                _buildTimeBox('Horas', '0'),
                SizedBox(width: 10),
                _buildTimeBox('Mins', '0'),
              ],
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "No existen partidos futuros",
                    style: TextStyle(color: AppColors.grey),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.teal,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/addMatch');
                    },
                    child: Text(
                      "Añadir partido",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Encuentros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Resultados',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Tendencias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Más',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.teal,
        unselectedItemColor: AppColors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),

      floatingActionButton: SpeedDial(
        backgroundColor: AppColors.teal,
        icon: Icons.add,
        activeIcon: Icons.close,
        buttonSize: Size(60, 50),
        spacing: 12,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        children: [
          SpeedDialChild(
            child: Icon(Icons.sports_soccer, color: AppColors.black),
            backgroundColor: AppColors.teal,
            label: 'Añadir un partido',
            labelStyle: TextStyle(color: AppColors.black),
            labelBackgroundColor: AppColors.teal,
            onTap: () {
              Navigator.pushNamed(context, '/addMatch');
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.receipt, color: AppColors.black),
            backgroundColor: AppColors.teal,
            label: 'Añadir resultado',
            labelStyle: TextStyle(color: AppColors.black),
            labelBackgroundColor: AppColors.teal,
            onTap: () => print('Añadir resultado'),
          ),
          SpeedDialChild(
            child: Icon(Icons.cloud_upload, color: AppColors.black),
            backgroundColor: AppColors.teal,
            label: 'Subir partidos',
            labelStyle: TextStyle(color: AppColors.black),
            labelBackgroundColor: AppColors.teal,
            onTap: () => print('Subir partidos'),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildTimeBox(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.teal,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
