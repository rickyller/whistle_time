import 'package:flutter/material.dart';

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

class Welcome extends StatelessWidget {
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
              Positioned(
                left: 120,
                top: 287,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: ShapeDecoration(
                    color: Color(0xFFDEE4DF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
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
                    height: 0.04,
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 672,
                child: Container(
                  width: 290,
                  height: 56,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 290,
                          height: 56,
                          decoration: ShapeDecoration(
                            color: Color(0xFF136B55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 116.40,
                        top: 16,
                        child: SizedBox(
                          width: 59.20,
                          child: Text(
                            'Ingresa',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 738,
                child: Container(
                  width: 290,
                  height: 56,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 290,
                          height: 56,
                          decoration: ShapeDecoration(
                            color: Color(0xFFA3F2D7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 105.36,
                        top: 16,
                        child: SizedBox(
                          width: 80.28,
                          child: Text(
                            'Registrate',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF002118),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ),
                      ),
                    ],
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