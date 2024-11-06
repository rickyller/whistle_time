//import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

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
        body: ListView(
          children: [
            SignUp(),
          ],
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
final _formKey = GlobalKey<FormState>();
final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

void _register() {
  if (_formKey.currentState!.validate()) {
    // Handle the registration logic, e.g., calling an API.
    // For this example, let's just print to the console.
    print("Registering user:");
    print("Name: ${_nameController.text}");
    print("Email: ${_emailController.text}");
    print("Password: ${_passwordController.text}");
    // Clear the fields after registration
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }
}
void _registerWithGoogle() {
  // Handle Google sign-in here, using Firebase or any other method.
  print("Register with Google");
}

@override
void dispose() {
  _nameController.dispose();
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) {
  return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFF5FBF6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 276,
                child: Container(
                  width: 390,
                  height: 568,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFDEE4DF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 348,
                child: Container(
                  width: 390,
                  height: 496,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEFF5F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              // Botón "Regístrate"
              Positioned(
                left: 50,
                top: 672,
                child :GestureDetector(
                  onTap: _register,
                  child: Container(
                    width: 290,
                    height: 56,
                    child: const Center(
                      child: Text(
                        'Registrate',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF136B55),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              // Botón "Regístrate con Google" con ícono de Google
              Positioned(
                left: 50,
                top: 738,
                child: GestureDetector(
                  onTap: _registerWithGoogle,
                  child: Container(
                    width: 290,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA3F2D7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons_smartphone/Google.svg',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Registrate con Google',
                          style: TextStyle(
                            color: Color(0xFF002118),
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Icono de retroceso en la esquina superior izquierda
              Positioned(
                left: 30,
                top: 30,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFA3F2D7),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons_smartphone/boton_atras.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 120,
                top: 80,
                child: Container(
                  width: 150,
                  height: 150,
                  child: SvgPicture.asset(
                    'assets/logo/whistleTime - logo sin letras.svg',
                    height: 50,
                    width: 50,
                  ),
                  decoration: const ShapeDecoration(
                    color: Color(0xFFDEE4DF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              const Positioned(
                left: 92,
                top: 296,
                child: Text(
                  'Crear nueva cuenta',
                  style: TextStyle(
                    color: Color(0xFF3F4945),
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Campos de formulario
              Positioned(
                left: 45,
                top: 398,
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: 300,
                    child: Column(
                      children: [
                        // Campo "Nombre completo"
                        _buildFormField('Nombre completo', _nameController),
                        const SizedBox(height: 10),
                        // Campo "Email"
                        _buildFormField('Email', _emailController),
                        const SizedBox(height: 10),
                        // Campo "Contraseña"
                        _buildFormField('Contraseña', _passwordController, isPassword:  true),
                      ],
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

  // Función para construir campos de formulario reutilizables
  Widget _buildFormField(String labelText, TextEditingController controller, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 300,
          height: 50,
          child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFD9D9D9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none
              ),
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Este campo es obligatorio';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
