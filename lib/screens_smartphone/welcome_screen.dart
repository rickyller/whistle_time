import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../themes/theme.dart';
import '../constants/strings.dart'; // Importa el archivo strings.dart

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(Theme.of(context).textTheme).light(), // Utiliza el tema definido en theme.dart
      home: Scaffold(
        body: ListView(
          children: const [
            Welcome(),
          ],
        ),
      ),
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _isHoveredIngresar = false;
  bool _isHoveredRegistrar = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final secondaryContainerColor = theme.colorScheme.secondaryContainer;
    final onPrimaryColor = theme.colorScheme.onPrimary;
    final onSecondaryColor = theme.colorScheme.onSecondary;

    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: theme.scaffoldBackgroundColor,
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
                    color: primaryColor,
                    shape: const RoundedRectangleBorder(
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
                  AppStrings.welcomeTitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // Botón "Ingresa" con animación de hover
              Positioned(
                left: 50,
                top: 672,
                child: MouseRegion(
                  onEnter: (_) => setState(() => _isHoveredIngresar = true),
                  onExit: (_) => setState(() => _isHoveredIngresar = false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 290,
                    height: 56,
                    decoration: BoxDecoration(
                      color: _isHoveredIngresar ? primaryColor.withOpacity(0.8) : primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.loginButton,
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: onPrimaryColor,
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
                  onEnter: (_) => setState(() => _isHoveredRegistrar = true),
                  onExit: (_) => setState(() => _isHoveredRegistrar = false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 290,
                    height: 56,
                    decoration: BoxDecoration(
                      color: _isHoveredRegistrar ? secondaryContainerColor.withOpacity(0.8) : secondaryContainerColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.registerButton,
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: onSecondaryColor,
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
