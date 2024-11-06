import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Welcome(),
        ]),
      ),
    );
  }
}

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _isHoveredIngresar = false;
  bool _isHoveredRegistrar = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFFF5FBF6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Stack(
            children: [
              // Fondo verde en la parte superior
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 390,
                  height: 362,
                  decoration: ShapeDecoration(
                    color: Color(0xFF136B55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
              // Logo de la aplicación
              Positioned(
                left: 120,
                top: 287,
                child: SvgPicture.asset(
                  'assets/logo/whistleTime_sinLetras.svg',
                  width: 150,
                  height: 150,
                ),
              ),
              // Título de la aplicación
              Positioned(
                left: 86,
                top: 474,
                child: Text(
                  'WHISTLE TIME',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF136B55),
                    fontSize: 32,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
              ),
              // Botón "Ingresa" con animación de hover
              Positioned(
                left: 50,
                top: 672,
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      _isHoveredIngresar = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _isHoveredIngresar = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 290,
                    height: 56,
                    decoration: BoxDecoration(
                      color: _isHoveredIngresar ? Color(0xFF0F553D) : Color(0xFF136B55),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Ingresa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Botón "Regístrate" con animación de hover
              Positioned(
                left: 50,
                top: 738,
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      _isHoveredRegistrar = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _isHoveredRegistrar = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 290,
                    height: 56,
                    decoration: BoxDecoration(
                      color: _isHoveredRegistrar ? Color(0xFF91E8C6) : Color(0xFFA3F2D7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Regístrate',
                        style: TextStyle(
                          color: Color(0xFF002118),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
