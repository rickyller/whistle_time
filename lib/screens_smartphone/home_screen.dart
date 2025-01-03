import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          Home(),
        ]),
      ),
    );
  }
}

class Home extends StatelessWidget {
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
                left: 20,
                top: 306,
                child: Container(
                  width: 351,
                  height: 505,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 425,
                        child: Opacity(
                          opacity: 0.85,
                          child: Container(
                            width: 351,
                            height: 80,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 351,
                                    height: 80,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF136B55),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 77,
                                  top: 10,
                                  child: Transform(
                                    transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                    child: Container(
                                      width: 60,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 83,
                                  top: 42,
                                  child: Container(
                                    width: 257,
                                    height: 28,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 257,
                                            height: 28,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFA3F2D7),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 229,
                                          top: 0,
                                          child: SizedBox(
                                            width: 28,
                                            height: 28,
                                            child: Text(
                                              '1',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF002118),
                                                fontSize: 14,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                                height: 0.10,
                                                letterSpacing: 0.25,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 12,
                                          top: 0,
                                          child: SizedBox(
                                            width: 56,
                                            height: 28,
                                            child: Text(
                                              'América',
                                              style: TextStyle(
                                                color: Color(0xFF002118),
                                                fontSize: 14,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                                height: 0.10,
                                                letterSpacing: 0.25,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 83,
                                  top: 10,
                                  child: Container(
                                    width: 257,
                                    height: 28,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Opacity(
                                            opacity: 0,
                                            child: Container(
                                              width: 257,
                                              height: 28,
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 229,
                                          top: 11,
                                          child: SizedBox(
                                            width: 28,
                                            height: 28,
                                            child: Text(
                                              '0',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                                height: 0.10,
                                                letterSpacing: 0.25,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 12,
                                          top: 11,
                                          child: Text(
                                            'Pachuca',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 17,
                                  top: 20,
                                  child: Container(
                                    width: 47,
                                    height: 39,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 2,
                                          top: 10,
                                          child: Text(
                                            '26/09',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.09,
                                              letterSpacing: 0.15,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          top: 28,
                                          child: Opacity(
                                            opacity: 0.70,
                                            child: Text(
                                              'Liga MX',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                                height: 0.11,
                                                letterSpacing: 0.40,
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
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 330,
                        child: Container(
                          width: 351,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 351,
                                  height: 80,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF136B55),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 77,
                                top: 10,
                                child: Transform(
                                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                  child: Container(
                                    width: 60,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign: BorderSide.strokeAlignCenter,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 83,
                                top: 42,
                                child: Container(
                                  width: 257,
                                  height: 28,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Opacity(
                                          opacity: 0,
                                          child: Container(
                                            width: 257,
                                            height: 28,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFA3F2D7),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 229,
                                        top: 13,
                                        child: SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Text(
                                            '0',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12,
                                        top: 13,
                                        child: SizedBox(
                                          width: 212,
                                          height: 28,
                                          child: Text(
                                            'Rayo de Ocotlán',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 83,
                                top: 10,
                                child: Container(
                                  width: 257,
                                  height: 28,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Opacity(
                                          opacity: 0,
                                          child: Container(
                                            width: 257,
                                            height: 28,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 229,
                                        top: 11,
                                        child: SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Text(
                                            '0',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12,
                                        top: 11,
                                        child: SizedBox(
                                          width: 88,
                                          height: 28,
                                          child: Text(
                                            'Atl. Rosario',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 17,
                                top: 20,
                                child: Container(
                                  width: 47,
                                  height: 39,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 2,
                                        top: 10,
                                        child: Text(
                                          '26/09',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            height: 0.09,
                                            letterSpacing: 0.15,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 28,
                                        child: Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            'Liga MX',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.11,
                                              letterSpacing: 0.40,
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
                      ),
                      Positioned(
                        left: 0,
                        top: 235,
                        child: Container(
                          width: 351,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 351,
                                  height: 80,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF136B55),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 77,
                                top: 10,
                                child: Transform(
                                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                  child: Container(
                                    width: 60,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign: BorderSide.strokeAlignCenter,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 83,
                                top: 42,
                                child: Container(
                                  width: 257,
                                  height: 28,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Opacity(
                                          opacity: 0,
                                          child: Container(
                                            width: 257,
                                            height: 28,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFA3F2D7),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 229,
                                        top: 13,
                                        child: SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Text(
                                            '1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12,
                                        top: 13,
                                        child: SizedBox(
                                          width: 217,
                                          height: 28,
                                          child: Text(
                                            'FC. San Juan ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 83,
                                top: 10,
                                child: Container(
                                  width: 257,
                                  height: 28,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 257,
                                          height: 28,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFA3F2D7),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 229,
                                        top: 13,
                                        child: SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Text(
                                            '3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF002118),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12,
                                        top: 13,
                                        child: SizedBox(
                                          width: 217,
                                          height: 28,
                                          child: Text(
                                            'Deportivo San Rafael',
                                            style: TextStyle(
                                              color: Color(0xFF002118),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 17,
                                top: 20,
                                child: Container(
                                  width: 47,
                                  height: 39,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 2,
                                        top: 10,
                                        child: Text(
                                          '26/09',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            height: 0.09,
                                            letterSpacing: 0.15,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 28,
                                        child: Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            'Liga MX',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.11,
                                              letterSpacing: 0.40,
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
                      ),
                      Positioned(
                        left: 0,
                        top: 140,
                        child: Container(
                          width: 351,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 351,
                                  height: 80,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF136B55),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 77,
                                top: 10,
                                child: Transform(
                                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                  child: Container(
                                    width: 60,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign: BorderSide.strokeAlignCenter,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 83,
                                top: 42,
                                child: Container(
                                  width: 257,
                                  height: 28,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 257,
                                          height: 28,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFA3F2D7),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 229,
                                        top: 13,
                                        child: SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Text(
                                            '3',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF002118),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12,
                                        top: 13,
                                        child: SizedBox(
                                          width: 217,
                                          height: 28,
                                          child: Text(
                                            'Cd. Juarez',
                                            style: TextStyle(
                                              color: Color(0xFF002118),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 83,
                                top: 10,
                                child: Container(
                                  width: 257,
                                  height: 28,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Opacity(
                                          opacity: 0,
                                          child: Container(
                                            width: 257,
                                            height: 28,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 229,
                                        top: 11,
                                        child: SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Text(
                                            '0',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12,
                                        top: 11,
                                        child: SizedBox(
                                          width: 56,
                                          height: 28,
                                          child: Text(
                                            'Necaxa',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 17,
                                top: 20,
                                child: Container(
                                  width: 47,
                                  height: 39,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 2,
                                        top: 10,
                                        child: Text(
                                          '26/09',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            height: 0.09,
                                            letterSpacing: 0.15,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 28,
                                        child: Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            'Liga MX',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.11,
                                              letterSpacing: 0.40,
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
                      ),
                      Positioned(
                        left: 0,
                        top: 45,
                        child: Container(
                          width: 351,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 351,
                                  height: 80,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF136B55),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 77,
                                top: 10,
                                child: Transform(
                                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                  child: Container(
                                    width: 60,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign: BorderSide.strokeAlignCenter,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 17,
                                top: 21,
                                child: Container(
                                  width: 47,
                                  height: 39,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 2,
                                        top: 10,
                                        child: Text(
                                          '26/09',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            height: 0.09,
                                            letterSpacing: 0.15,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 28,
                                        child: Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            'Liga MX',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.11,
                                              letterSpacing: 0.40,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 83,
                                top: 42,
                                child: Container(
                                  width: 257,
                                  height: 28,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 257,
                                          height: 28,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFA3F2D7),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 229,
                                        top: 13,
                                        child: SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Text(
                                            '1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF002118),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12,
                                        top: 13,
                                        child: SizedBox(
                                          width: 56,
                                          height: 28,
                                          child: Text(
                                            'América',
                                            style: TextStyle(
                                              color: Color(0xFF002118),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 83,
                                top: 10,
                                child: Container(
                                  width: 257,
                                  height: 28,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Opacity(
                                          opacity: 0,
                                          child: Container(
                                            width: 257,
                                            height: 28,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 229,
                                        top: 11,
                                        child: SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Text(
                                            '0',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12,
                                        top: 11,
                                        child: Text(
                                          'Pachuca',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0.10,
                                            letterSpacing: 0.25,
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
                      ),
                      Positioned(
                        left: 0,
                        top: 11,
                        child: SizedBox(
                          width: 153,
                          height: 26,
                          child: Text(
                            'Reportes recientes',
                            style: TextStyle(
                              color: Color(0xFF171D1A),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 254,
                        top: 0,
                        child: Container(
                          width: 97,
                          height: 26,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 97,
                                  height: 26,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFA3F2D7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 12,
                                top: 11,
                                child: SizedBox(
                                  width: 74,
                                  height: 26,
                                  child: Text(
                                    'Ver todos >',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF002118),
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 0.11,
                                      letterSpacing: 0.40,
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
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 390,
                  height: 287,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 390,
                          height: 287,
                          decoration: ShapeDecoration(
                            color: Color(0xFF136B55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 175,
                        top: 264,
                        child: Container(
                          width: 40,
                          height: 8,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 16,
                                top: 0,
                                child: Opacity(
                                  opacity: 0.70,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 32,
                                top: 0,
                                child: Opacity(
                                  opacity: 0.70,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 44,
                        top: 139,
                        child: Container(
                          width: 301,
                          height: 83,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 51,
                                  height: 82,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 6,
                                        top: 0,
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFD9D9D9),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 54,
                                        child: Text(
                                          'Atlas',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0.06,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 8,
                                        top: 72,
                                        child: Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            'Local',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.10,
                                              letterSpacing: 0.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 235,
                                top: 0,
                                child: Container(
                                  width: 66,
                                  height: 82,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 13,
                                        top: 0,
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFD9D9D9),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 54,
                                        child: Text(
                                          'Chivas',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0.06,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 4,
                                        top: 72,
                                        child: Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            'Visitante',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.10,
                                              letterSpacing: 0.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 120,
                                top: 20,
                                child: Container(
                                  width: 61,
                                  height: 38,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Text(
                                          '9:20 PM',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            height: 0.09,
                                            letterSpacing: 0.15,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 14,
                                        top: 18,
                                        child: Opacity(
                                          opacity: 0.70,
                                          child: Text(
                                            '26/09',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0.11,
                                              letterSpacing: 0.40,
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
                      ),
                      Positioned(
                        left: 97,
                        top: 70,
                        child: Text(
                          'Próximos partidos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 30,
                        child: Container(
                          width: 40,
                          height: 40,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFA3F2D7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/icons_smartphone/boton_notificacion.svg',
                                      width: 40,
                                      height: 40,
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
              ),
              Positioned(
                left: 0,
                top: 769,
                child: Container(
                  width: 390,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5FBF6), // Color del fondo del bottom menu
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: SvgPicture.asset(
                          'assets/icons_smartphone/menu/silbato.svg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: SvgPicture.asset(
                          'assets/icons_smartphone/menu/reporting.svg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: SvgPicture.asset(
                          'assets/icons_smartphone/menu/homeClicked.svg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: SvgPicture.asset(
                          'assets/icons_smartphone/menu/schedule.svg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: SvgPicture.asset(
                          'assets/icons_smartphone/menu/settings.svg',
                          width: 40,
                          height: 40,
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